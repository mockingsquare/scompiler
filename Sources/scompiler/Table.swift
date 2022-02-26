//
//  Table.swift
//  scompiler
//
//  Created by Jeeheon Kim on 2022-02-14.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

protocol Table {
  var transducer: Transducer? { get set }
  var type: TableType { get } // Might not need it
  func run() throws -> Int?
  func registerTable(rawTable: RawTable) -> Void
}

// TODO: Maybe it is better to make (String, Int) an object so that we can add methods for checking isRead/isNode/isStack...
protocol TableWithTransitionsWithIntKey {
  var transitions: [Int: (String, Int)] { get set }
}

protocol TableWithTransitionsWithStringKey {
  var transitions: [String: (String, Int)] { get set }
}

protocol TableWithTransitionsWithPairKey {
  var transitions: [PairHashable<String, Int>: (String, Int)] { get set }
}

class TableFactory {
// Factory that makes different types of table based on the parameter
  static func create(type: String) throws -> Table {
    switch TableType(rawValue: type) {
      case .ScannerReadaheadTable:
        return ScannerReadaheadTable()
      case .SemanticTable:
        return SemanticTable()
      case .ReadaheadTable:
        return ReadaheadTable()
      case .ReadbackTable:
        return ReadbackTable()
      case .ShiftbackTable:
        return ShiftbackTable()
      case .ReduceTable:
        return ReduceTable()
      case .AcceptTable:
        return AcceptTable()
      default:
        throw TransducerError.invalidRawTable  // If you enter this, add more case
    }
  }
}

class ScannerReadaheadTable: Table, TableWithTransitionsWithIntKey {
  var type = TableType.ScannerReadaheadTable
  var transducer: Transducer? 
  var transitions = [Int: (String, Int)]()
  init() {}

  func run() throws -> Int? {
    let s = transducer as! Scanner
    let char = s.peekInput(); Scompiler.logger.debug("\t table has peeked at char `\(char)`")
    guard char != nil else { throw TransducerError.lexicalError }
    let charAsInt = Int(char!.asciiValue!); Scompiler.logger.debug("\t\t peekedChar's ascii `\(charAsInt)`")
    let pair = transitions[charAsInt]; Scompiler.logger.debug("\t\t transition for \(charAsInt) - \(pair) ")
    if pair != nil {
      let attributes = pair!.0; let goto = pair!.1
      let isRead = attributes.contains("R")
      let isKeep = attributes.contains("K")
      if !isRead { return goto }
      if isKeep {
        s.keptCharacters = s.keptCharacters + String(char!)
      }
      s.discardInput()
      return goto 
    }
    throw TransducerError.lexicalError
  }

  func registerTable(rawTable: RawTable) -> Void {
    transitions = [Int: (String, Int)]()
    guard rawTable is RawScannerReadaheadTable else { 
      print("lol-1"); return 
    }
    let t = rawTable as! RawScannerReadaheadTable
    for triple in t.triples {
      for characterOrInteger in triple.first {
        var asciiInt: Int
        if let char = characterOrInteger as? Character {
          asciiInt = Int((characterOrInteger as! Character).asciiValue!)
        } else if let int = characterOrInteger as? Int {
          asciiInt = characterOrInteger as! Int
        } else {
          Scompiler.logger.error("Table is set up wrong")
          return
        }
        transitions[asciiInt] = (triple.second, Int(triple.third)) // TODO: maybe Int64 - triple.third into Int
      }
    }
  }
}

class SemanticTable: Table {
  var type = TableType.SemanticTable
  var transducer: Transducer?
  var action: String?
  var parameters: [Any]?
  var goto: Int?

  init() {}

  func registerTable(rawTable: RawTable) -> Void {
    guard rawTable is RawSemanticTable else { 
      return 
    }
    let t = rawTable as! RawSemanticTable
    self.action = t.action
    self.parameters = t.parameters
    self.goto = t.gotoTableNumber
  }

  func run() throws -> Int? { 
    // See if the given transducer can understand action
    // scanner's actions have value of true
    // parser's actions have value of false
    // if not understandable for both, value of nil
    let scannerAction = [
      "buildToken": true,
      "buildTree": false
    ]

    guard action != nil, parameters != nil else { 
      throw TransducerError.lexicalError 
    }
    let a = action!; let p = parameters!
    Scompiler.logger.debug("\t table has to run \(action)(\(parameters))")
    if self.transducer is Scanner {
      if scannerAction[action!] == true {
        // run the action
        let recipient = transducer!
        try recipient.performActionWithParameter(action: a, p)
      }  else {
        // not a scannerAction or not defined (false or nil)
        // this assumes that the scannerAction is 
        let recipient = transducer!.sponsor! // sponsor is the SampleTranslator
        try recipient.performActionWithParameter(action: a, p)
      }
    }
    else if self.transducer is Parser {
      if scannerAction[a] == false {
        // run the action
        let recipient = transducer!
        try recipient.performActionWithParameter(action: a, p)
      } else {
        // not a scannerAction or not defined (false or nil)
        // this assumes that the scannerAction is 
        let recipient = transducer!.sponsor! // sponsor is the SampleTranslator
        try recipient.performActionWithParameter(action: a, p)
      }
    }
    Scompiler.logger.debug("\t\t transition to \(goto)")
    return goto
  }
}

class ReadaheadTable: Table, TableWithTransitionsWithStringKey {
  var type = TableType.ReadaheadTable
  var transducer: Transducer?
  var transitions = [String: (String, Int)]()

  func registerTable(rawTable: RawTable) -> Void {
    // peek at the next token label
    guard rawTable is RawReadaheadTable else { 
      Scompiler.logger.error("RawTable Error: Cannot register raw table type \(rawTable.type) as ReadaheadTable")
      return
    }
    let t = rawTable as! RawReadaheadTable
    
    transitions = [String: (String, Int)]()
    for triple in t.triples {
      transitions[triple.first] = (triple.second, triple.third)
    }
  }

  func run() throws -> Int? {
    // peek at the next token label
    guard transducer is Parser else { 
      throw TransducerError.transducerError
    }
    let transducer = transducer as! Parser
    let token = transducer.peekScannerToken()
    let tokenLabel = token.label
    guard tokenLabel != nil else { print("TODO: implement syntax error"); return nil; }
    let transition = transitions[tokenLabel!]
    guard transition != nil else {
      Scompiler.logger.error("Syntax error: `\(tokenLabel!)` is not allowed\n")
      return nil
    }

    let attributes = transition!.0; let goto = transition!.1
    
    let isRead = attributes.contains("R")
    let isNode = attributes.contains("N")
    let isStack = attributes.contains("S")
    if !isRead {
      return goto
    }
    transducer.discardScannerToken()
    if isStack {
      transducer.tokenStack.append(token)
      transducer.tableNumberStack.append(goto)
      transducer.treeStack.append(isNode ? token : nil)
      transducer.right = transducer.tokenStack.count - 1
      transducer.left = transducer.right + 1
    }
    // Use the transition that matches it if there is one
    // Use the attributes to determine what do to
    // Case:  there isn't one -> Syntax error
    // Case "R": meas look("L")
    // Case "N": make the token part of a tree
    // Case "S": stack - 
    Scompiler.logger.debug("\tleft: \( transducer.left), right: \( transducer.right)")
    Scompiler.logger.debug("\t\ttransition for \(tokenLabel) to \(goto)")
    return goto
  }
}

class ReadbackTable: Table, TableWithTransitionsWithPairKey {
  var type = TableType.ReadbackTable
  var transducer: Transducer?
  var transitions: [PairHashable<String, Int>: (String, Int)] = [:]

  func registerTable(rawTable: RawTable) -> Void {
    guard rawTable is RawReadbackTable else { 
      return 
    }
    let t = rawTable as! RawReadbackTable
    
    transitions = [:]
    for triple in t.triples {
      transitions[PairHashable(triple.first)] = (triple.second, triple.third)
    }
  }

  func run() throws -> Int? {
    // peek at the next token label
    guard transducer is Parser else { 
      throw TransducerError.transducerError
    }

    let transducer = transducer as! Parser
    //Readback considers the token label in the token stack and the state number in 

    let a = transducer.tokenStack[transducer.left - 1].label
    let b = transducer.tableNumberStack[transducer.left - 1]
    let pair = PairHashable((a!,b))
    if transitions[pair] == nil {
      throw TransducerError.designError("")
    }
    let transition = transitions[pair]!
    let attributes = transition.0
    let goto = transition.1

    let isRead = attributes.contains("R")
    if isRead {
      transducer.left = transducer.left - 1
    }
    Scompiler.logger.debug("\tleft: \( transducer.left), right: \( transducer.right)")
    return goto
  }
}

class ShiftbackTable: Table {
  //Shifts Parser's left by `shift`
  var type = TableType.ShiftbackTable
  var transducer: Transducer?
  var shift: Int = 0; var goto: Int = -1 //MARK: no shift; invalid goto as initial value for now

  func registerTable(rawTable: RawTable) -> Void {
    //Record the data as it needs
    guard rawTable is RawShiftbackTable else { 
      return 
    }
    let t = rawTable as! RawShiftbackTable
      
    shift = t.shift
    goto = t.gotoTable
  }

  func run() throws -> Int? {
    guard transducer is Parser else { 
      throw TransducerError.transducerError
    }
    let transducer = transducer as! Parser

    //Adjust left by the amount specified and return the goto table
    transducer.left = transducer.left - shift
    Scompiler.logger.debug("\tleft: \( transducer.left), right: \( transducer.right)")

    return goto
  }
}

class ReduceTable: Table, TableWithTransitionsWithIntKey {
  var type = TableType.ReduceTable
  var transducer: Transducer?
  var nonterminal: String? //MARK: Symbol
  var transitions: [Int : (String, Int)] = [:]

  func registerTable(rawTable: RawTable) -> Void {
    // Store the data (non-terminal and transition information, and
    // triples starting table #, attributes, destination table #)
    guard rawTable is RawReduceTable else { 
      return 
    }
    let t = rawTable as! RawReduceTable
      
    nonterminal = t.nonterminal
    transitions = [Int : (String, Int)]()
    for triple in t.triples {
      transitions[triple.stackTopState] = (triple.attributes, triple.gotoTable)
    }    
  }

  func run() throws -> Int? {
    // Reduce to A: A is the nonterminal to reduce to.
    // Pick up the new tree and simulate a readahead of A where the new tree is associated with A
    guard transducer is Parser else { 
      throw TransducerError.transducerError
    }
    let transducer = transducer as! Parser
    var tree: TreeNode? = nil

    if transducer.newTree != nil {
      tree = transducer.newTree as! TreeNode
      transducer.newTree = nil
    } else {
      // Capture that one subtree (if any) and have it ready for stacking
      Scompiler.logger.debug("\tArray of size (\(transducer.treeStack.count)) - [\(transducer.left)~\(transducer.right)]")
      let indices = transducer.left...transducer.right
      let treeStackWithNils = transducer.treeStack[indices]
      let children = treeStackWithNils.compactMap { $0 } // store treeStack without nils

      if children.count == 0 { 
        tree = nil 
      } else if children.count == 1 {
        tree = children.first
      } else {
        throw TransducerError.designError("more than one child in ReduceTable")
      }
    }

    // Clear the stacks between [left, right]
    let indices = transducer.left...transducer.right
    for idx in indices {
      transducer.tokenStack.removeLast()
      transducer.tableNumberStack.removeLast()
      transducer.treeStack.removeLast()
    }

    // Use the top table number on the stack (`from table`) and locate the pair (attr, `to table`)
    // Case1: If you cannot find it, then it is a design error
    // Case2: If done, return the other table #
    // Case3: Use the attributes as you did for a Readaheadtable
    //        + use a new token(instead of next token) you create using the nonterminal as a symbol
    //        + adjust `left` and `right`
    let tableNumber = transducer.tableNumberStack.last!
    
    if  let transition = self.transitions[tableNumber] {
      let attribute = transition.0; let goto = transition.1;
      let isStack = attribute.contains("S")
      let isNode = attribute.contains("N")
      if isStack {
        let newToken = Token(label: nonterminal, symbol: nonterminal)
        transducer.tokenStack.append(newToken)

        transducer.tableNumberStack.append(goto)
        transducer.treeStack.append(isNode ? tree : nil)
        Scompiler.logger.debug("\ttoken added to the stack is <\(nonterminal): \( nonterminal)>")
      }
      transducer.right = transducer.treeStack.count - 1
      transducer.left = transducer.right + 1
      Scompiler.logger.debug("\tleft: \( transducer.left), right: \( transducer.right)")

      return goto
    } else {
      throw TransducerError.designError("")
    }
  }
}

class AcceptTable: Table {
  var type = TableType.AcceptTable
  var transducer: Transducer?

  func registerTable(rawTable: RawTable) -> Void {
    //Do nothing
  }

  func run() -> Int? {
    return nil
  }
}


//
//  Table.swift
//  scompiler
//
//  Created by Jeeheon Kim on 2022-02-14.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//
import Foundation

enum SyntaxError: Error {}
protocol Table {
  var transducer: Transducer? { get set }
  var type: TableType { get } // Might not need it
  func run() -> Int?
  func registerTable(rawTable: RawTable) -> Void
}

protocol TableWithTransitions {
  var transitions: [Int: (String, Int)] { get set }
}

class TableFactory {
  static func create(type: String) -> Table {
    switch TableType(rawValue: type) {
      case .ScannerReadaheadTable:
        return ScannerReadaheadTable()
      case .SemanticTable:
        return SemanticTable()
      case .ReadaheadTable:
        return ReadaheadTable()
      default:
        return SemanticTable() // If you enter this, add more case
    }
  }
}

class ScannerReadaheadTable: Table, TableWithTransitions {
  var type = TableType.ScannerReadaheadTable
  var transducer: Transducer? 
  var transitions = [Int: (String, Int)]()
  init() {}

  func run() -> Int? {
    let s = transducer as! Scanner
    let char = s.peekInput()
    guard char != nil else { return nil }
    let charAsInt = Int(char!.asciiValue!)
    guard charAsInt != nil else { return nil }
    let pair = transitions[charAsInt]
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
    //TODO: Throw report lexical error
    return nil
  }

  func registerTable(rawTable: RawTable) -> Void {
    transitions = [Int: (String, Int)]()
    guard rawTable is RawScannerReadaheadTable else { 
      print("lol-1"); return 
    }
    // guard rawTable.type == "RawScannerReadaheadTable" else {print("lol"); return }
    let t = rawTable as! RawScannerReadaheadTable
    for triple in t.triples {
      for characterOrInteger in Array(triple.first) {
        let asciiInt = Int(characterOrInteger.asciiValue!)
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
      print("lol-2"); return 
    }
    let t = rawTable as! RawSemanticTable
    self.action = t.action
    self.parameters = t.parameters
    self.goto = t.gotoTableNumber

    
  }
  func run() -> Int? { 
    // See if the given transducer can understand action
    // scanner's actions have value of true
    // parser's actions have value of false
    // if not understandable for both, value of nil
    let scannerAction = [
      "buildToken": true,
    ]

    guard action != nil, parameters != nil else { 
      print("lol-3"); return nil 
    }
    let a = action!; let p = parameters!
    if self.transducer is Scanner {
      if scannerAction[action!] == true {
        // run the action
        let recipient = transducer!
        recipient.performActionWithParameter(action: a, param: p)
      }  else {
        // not a scannerAction or not defined (false or nil)
        // this assumes that the scannerAction is 
        let recipient = transducer!.sponsor! // sponsor is the SampleTranslator
        recipient.performActionWithParameter(action: a, param: p)
      }
    }
    else if self.transducer is Parser {
      if scannerAction[a] == false {
        // run the action
        let recipient = transducer!
        recipient.performActionWithParameter(action: a, param: p)
      } else {
        // not a scannerAction or not defined (false or nil)
        // this assumes that the scannerAction is 
        let recipient = transducer!.sponsor! // sponsor is the SampleTranslator
        recipient.performActionWithParameter(action: a, param: p)
      }
    }
    return goto
  }
}

class ReadaheadTable: Table, TableWithTransitions {
  var type = TableType.ReadaheadTable
  var transducer: Transducer?
  var transitions:[Int: (String, Int)] = [:]

  func registerTable(rawTable: RawTable) -> Void {
    // peek at the next token label
    guard transducer is Parser else { 
      print("funny"); return 
    }
    let transducer = transducer as! Parser
    let token = transducer.peekScannerToken()
    let tokenLabel = token.label
    guard tokenLabel != nil else { return print("TODO: implement syntax error") }
    // transitions is saying that the key is Int
    // tokenLabel is string
    let transition = transitions[tokenLabel]
    let attributes = transition.attributes; let goto = transition.goto
    
    let isRead = attributes.contains("R")
    let isNode = attributes.contains("N")
    let isStack = attributes.contains("S")
    if isRead != true { return goto }
    transducer.discardScannerToken()
    if isStack {
      transducer.tokenStack.append(token)
      transducer.tableNumberStack.append(goto)
      // Does a tree s
      transducer.treeStack!.append(isNode ? token : nil)
    }
    // Use the transition that matches it if there is one
    // Use the attributes to determine what do to
    // Case:  there isn't one -> Syntax error
    // Case "R": meas look("L")
    // Case "N": make the token part of a tree
    // Case "S": stack - 

  }

  func run() -> Int? {
      
  }
}
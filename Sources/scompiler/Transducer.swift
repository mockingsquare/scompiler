//
//  Transducer.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

class Transducer {
  var sponsor: Any? = nil
  var tables: [Table] = []
}

final class Parser: Transducer {
  var scanner: Scanner = Scanner()
  var screener: Screener = Screener()
  var tokenStack: [Token] = [
    Token(label: "|-", symbol: "|-")
  ]
  var tableNumberStack: [Int] = [1]
  var treeStack: [Tree]? = nil
  var left: Int = 1
  var right: Int = 1
  var tableNumber: AnyObject? = nil
  var newTree: AnyObject? = nil

  init(sponsor: Any?, parserTables: RawParserTables, scannerTables: RawScannerTables) {
    super.init()
    // Set up the user of the scanner and parser
    self.sponsor = sponsor
    self.scanner.sponsor = sponsor
    // Give the keywords to the screener and the remaining tables to the parser
    self.screener = Screener(keywords: Array(parserTables.keywords)) // array of keywords
    registerTables(rawTables: parserTables)

    // Give the entire set of scanner tables to the scanner
    self.scanner.registerTables(rawTables: scannerTables)
  }

  private func registerTables(rawTables: RawParserTables) -> Void {
    let rawTablesIndices = 0..<rawTables.size
    for idx in rawTablesIndices {
      let rawTable = rawTables[idx]
      // Get the class name for the type, then make a new instance then give it the table
      // Also, tell it that "I" am the transducer
      var tableObject = TableFactory.create(type: rawTable!.type)
      tableObject.registerTable(rawTable: rawTable!)
      tableObject.transducer = self
      tables.append(tableObject)
    }
  }

  func parse(_ text: String) -> Tree? {
    /*
    	To parse the text, you have to give it to the scanner (say via scan: text).
      It in turn should have the first token set up for you. Next you need
      to execute tables starting from table 1 until you reach an Accept table.
      Once that happen, the tree that was built should be on top of the tree
      stack. Just return it. If you look at the Accept table, you will see
      that it of all the tables, it is the only one that returns nil. You can
      use that information to stop your loop.
    */
    scanner.scanTokens(text) 
    var idx: Int = 0
    var t = tables[idx]
    
    while t.type != .AcceptTable {
      idx = t.run()! // idx be a number!
      // guard idx != nil else { break } // Else should not be run
      t = tables[idx]
    }

    if let s = treeStack {
      return s.last
    }

    return nil //TODO: shouldn't come here
  }

  func registerTable(rawTables: RawParserTables) -> Void {
    let rawTablesIndices = 0..<rawTables.size
    for idx in rawTablesIndices {
      let t = rawTables[idx]
      var table = TableFactory.create(type: t!.type)
      table.transducer = self
      self.tables.append(table)
    }
  }
}

// Scanner: Scan text and output tokens
final class Scanner: Transducer {
  private var input: String?
  private var token: Token?
  var keptCharacters: String = ""
  
  var start: String.Index?
  var current: String.Index?

  static let sharedEmpty = Scanner()

  private func isAtEnd() -> Bool {
    if let input = input {
      return current == input.endIndex
    }
    return true // if there's no code at all, just say that it has reached the end
  }

  // st. scan:
  func scanTokens(_ text: String) {
    // Smalltalk says ReadStream but...
    input = text
    start = input!.startIndex
    current = start
    discardToken()
  }

  func buildToken(label: String) {
    // Create a token with the supplied label and keptCharacters in the scanner
    // the result would be used by `peek`
    // Reset keptCharacters so the process can repeat
    token = Token(label: label, symbol: keptCharacters)

    keptCharacters = ""
  }

  func discardInput() ->  Character {
    // guard current != input!.endIndex else { return nil }
    let prev = current!
    current = input!.index(after: current!)
    // returns a Character that scanner is neglecting
    return input![prev]
  }

  func discardToken() {
    // Set token to nil
    // Execute tables in a loop starting with table1 until token is no longer nil
    // * Somewhere during this execution, the semantic action buildToken:
    // * will execute putting something into variable 'token'
    var idx = 0

    while token == nil {
      let t = tables[idx] 
      idx = t.run()!
    }
  }

  // st.: Scanner > tables
  func registerTables(rawTables: RawTables) ->  Void {
    let rawTablesIndices = 0..<rawTables.size
    // transform rawTable (tableType tableNumber ...) to appropriate tableObjects
    for idx in rawTablesIndices {
      //TODO: Check if rawTable is actually the parameter of registerTable
      let rawTable = rawTables[idx]
      var tableObject = TableFactory.create(type: rawTable!.type)
      tableObject.registerTable(rawTable: rawTable!)
      tableObject.transducer = self
      tables.append(tableObject)
/*
      let rawTable = rawTables[idx]
      // Get the class name for the type, then make a new instance then give it the table
      // Also, tell it that "I" am the transducer
      var tableObject = TableFactory.create(type: rawTable!.type)
      tableObject.transducer = self
*/
    }
  }


  // It peeks at input and returns an "Integer" according to the alphabet
  func peekInput() -> Character? {
    guard current != input!.endIndex else { return nil }
    return input![current!]
  }

  func peekToken() -> Token {
    return token!
  }
}

class Screener: Transducer {
  var keywords: [String] = [String]()

  // static let sharedEmpty = Screener(keywords: [Table.sharedEmpty])
  override public init() {}
  public init(keywords: [String]) {
    self.keywords = keywords
  }

  func screen(_ token: Token) -> Token {
    //older name is #Identifier and newer name is #walkIdentifier
    if !(token.label == "identifier" || token.label == "walkIdentifier") {
      // if not #Identifier nor #walkIdentifier
      return token
    } 
    // if !keywords.contains(token.symbol) { return token }

    // if the token is an Identifier (of some sort)
    // and Screener's keyword contains a token's symbol
    // -> return a new token ([label:symbol] symbol:symbol)
    let newToken = Token(label: token.symbol, symbol: token.symbol)

    return newToken
  }
}
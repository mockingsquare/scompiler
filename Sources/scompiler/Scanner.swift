//
//  Scanner.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//


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

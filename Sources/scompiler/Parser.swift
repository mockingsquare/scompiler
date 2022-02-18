//
//  Scanner.swift
//  scompiler
//
//  Created by Jeeheon Kim on 02-18-2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

final class Parser: Transducer {
  var scanner: Scanner = Scanner()
  var screener: Screener = Screener()
  var tokenStack: [Token] = [
    Token(label: "|-", symbol: "|-")
  ]
  var tableNumberStack: [Int] = [1]
  var treeStack: [Any]? = nil
  var left: Int = 1
  var right: Int = 1
  var tableNumber: AnyObject? = nil
  var newTree: AnyObject? = nil

  init(sponsor: Translator?, parserTables: RawParserTables, scannerTables: RawScannerTables) {
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

  func parse(_ text: String) -> Any? {
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
  
  func doNothing() {}

  override func performActionWithParameter(action: String, param: [Any]) {
    switch action {
      case "buildTree":
        buildTree(param)
      default:
        doNothing() //nothing
    }
  }

  private func buildTree(_ rootNode: Any) {
    // Pick up the children from the tree stack between the left and right inclusive (provided they are not nil)
    //  and build a tree with the given label
    // Store it in instance newTree so a reduce table can use it
    // TODO: code missing
  }

  func discardScannerToken() -> Void {
    scanner.discardToken()
  }

  func peekScannerToken() -> Token {
    return screener.screen(scanner.peekToken())
  }
}

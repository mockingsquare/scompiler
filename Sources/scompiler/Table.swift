//
//  Table.swift
//  scompiler
//
//  Created by Jeeheon Kim on 2022-02-14.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

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
      default:
        return SemanticTable() // CHANGE
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
    guard rawTable is RawScannerReadaheadTable else { print("lol"); return }
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
  init() {
  }

  func registerTable(rawTable: RawTable) -> Void {
    
  }
  func run() -> Int? { return nil }
}
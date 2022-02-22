//
//  RawTables.swift
//  scompiler
//
//  Created by Jeeheon Kim on 02-14-2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//
protocol RawTables {
  var size: Int { get }
  subscript(index: Int) -> RawTable? { get }
}
protocol RawTable {
  var type: String { get }
}

protocol RawTriple {}

class RawTableWithTransitions {
  //There are certain types
  var transitions: [Int: (String, Int)] =  [Int: (String, Int)]()
  func registerTable(anArray: [(Int, String, Int)]) -> Void {
    for triple in anArray {
      transitions[triple.0] = (triple.1, triple.2)
    }
  }
}

struct RawSemanticTable: RawTable {
  let type = "SemanticTable"
  init(_ a: String, _ b: Int, _ c: String, _ d: Int, _ e: [String], _ f: Int) {
    name = a
    state = b
    action = c
    size = d
    parameters = e
    gotoTableNumber = f
  }
  let name: String
  let state: Int
  let action: String
  let size: Int
  let parameters: [String]
  let gotoTableNumber: Int
  var description: String {
    return ""
  }
}

struct RawReadaheadTriple: RawTriple {
  let type = "RawReadaheadTriple"
  init (_ arg1: String, _ arg2: String, _ arg3: Int) {
    string = arg1
    attributes = arg2
    gotoTable = arg3
  }
  var string: String
  var attributes: String
  var gotoTable: Int

  var first: String {
    get {return string}
  }

  var second: String {
    get {return attributes}
  }

  var third: Int {
    get {return gotoTable}
  }
  
  // func first<T>() -> T { return string }
  // func second<T>() -> T {return attributes}
  // func third<T>() -> T {return gotoTable}
}

struct RawReadaheadTable: RawTable {
  let type = "ReadaheadTable"
  init(_ a: String, _ b: Int, _ c: Int, _ d: [RawReadaheadTriple]) {
    name = a
    state = b
    size = c
    triples = d
  }
  var name: String
  var state: Int
  var size: Int
  var triples: [RawReadaheadTriple]
}

struct RawReadbackTriple: RawTriple {
  let type = "RawReadbackTriple"
  init(_ a: (String, Int), _ b: String, _ c: Int) {
    pair = a //(symbol, state)
    attributes = b
    gotoTable = c
  }
  var pair: (String, Int)
  var attributes: String
  var gotoTable: Int

  var first: (String, Int) {
    get {
      return pair
    }
  } 

  var second: String {
    get {
      return attributes
    }
  }

  var third: Int {
    get {
      return gotoTable
    }
  }
}

struct RawReadbackTable: RawTable {
  let type = "ReadbackTable"
  init(_ a: String, _ b: Int, _ c: Int, _ d: [RawReadbackTriple]) {
    name = a
    state = b
    size = c
    triples = d
  }
  var name: String
  var state: Int
  var size: Int
  var triples: [RawReadbackTriple]
}


struct RawShiftbackTable: RawTable {
  let type = "ShiftbackTable"
  init(_ a: String, _ b: Int, _ c: Int, _ d: Int) {
    name = a
    stateNumber = b
    shift = c
    gotoTable = d
  }
  var name: String
  var stateNumber: Int
  var shift: Int
  var gotoTable: Int
}

struct RawReduceTriple: RawTriple {
  let type = "RawReduceTriple"
  init(_ a: Int, _ b: String, _ c: Int) {
    stackTopState = a
    attributes = b
    gotoTable = c
  }
  //fromTableNumber, attributes, toTableNumber
  var stackTopState: Int
  var attributes: String
  var gotoTable: Int
}

struct RawReduceTable: RawTable {
  let type = "ReduceTable"
  init(_ a: String, _ b: Int, _ c: String, _ d: Int, _ e: [RawReduceTriple]) {
    name = a
    state = b
    nonterminal = c
    size = d
    triples = e
  }
  var name: String
  var state: Int
  var nonterminal: String
  var size: Int
  var triples: [RawReduceTriple]
}

struct RawAcceptTable: RawTable {
  let type = "AcceptTable"
  init(_ a: String, _ b: Int) {
    name = a
    state = b
  }
  var name: String
  var state: Int

  func run() -> Int? {
    // Ensure that parsing does not continue
    return nil
  }
}

struct RawParserTables: RawTables {
  var keywordsSize: Int
  var keywords: [String]
  var readaheadTablesSize: Int
  var readaheadTables: [RawReadaheadTable]
  var readbackTablesSize: Int
  var readbackTables: [RawReadbackTable]
  var shiftbackTablesSize: Int
  var shiftbackTables: [RawShiftbackTable]
  var reduceTablesSize: Int
  var reduceTables: [RawReduceTable]
  var semanticTablesSize: Int
  var semanticTables: [RawSemanticTable]
  var acceptTable: RawAcceptTable
  var size: Int {
    // Excludes keywordsSize
    get {
      return readaheadTablesSize + readbackTablesSize 
      +shiftbackTablesSize + reduceTablesSize + semanticTablesSize + 1
    }
  }
  subscript(index: Int) -> RawTable? {
    // keywords are not indexed
    let bound = [
      readaheadTablesSize, 
      readaheadTablesSize + readbackTablesSize, 
      readaheadTablesSize + readbackTablesSize + shiftbackTablesSize,
      readaheadTablesSize + readbackTablesSize + shiftbackTablesSize + reduceTablesSize,
      readaheadTablesSize + readbackTablesSize + shiftbackTablesSize + reduceTablesSize + semanticTablesSize
    ]
    if index >= 0, index < bound[0] {return readaheadTables[index]} 
    else if index < bound[1] {return readbackTables[index - bound[0]]} 
    else if index < bound[2] {return shiftbackTables[index - bound[1]]} 
    else if index < bound[3] {return reduceTables[index - bound[2]]}
    else if index < bound[4] {return semanticTables[index - bound[3]]}
    else if index <= bound[4] {return acceptTable}
    print("RawParserTables: Index out of bound")
    return nil
  }

  init(_ arg1: Int, _ arg2: [String],
    _ arg3: Int, _ arg4: [RawReadaheadTable],
    _ arg5: Int, _ arg6: [RawReadbackTable],
    _ arg7: Int, _ arg8: [RawShiftbackTable],
    _ arg9: Int, _ arg10: [RawReduceTable],
    _ arg11: Int, _ arg12: [RawSemanticTable],
    _ arg13: RawAcceptTable) {
    keywordsSize = arg1
    keywords = arg2
    readaheadTablesSize = arg3
    readaheadTables = arg4
    readbackTablesSize = arg5
    readbackTables = arg6
    shiftbackTablesSize = arg7
    shiftbackTables = arg8
    reduceTablesSize = arg9
    reduceTables = arg10
    semanticTablesSize = arg11
    semanticTables = arg12
    acceptTable = arg13
  }
}

/*
*
* SCANNER
*
*/

struct RawScannerReadaheadTriple: CustomStringConvertible {
  let type = "RawScannerReadaheadTriple"
  init(_ a: String, _ b: String, _ c: Int64) {
    string = a
    attributes = b
    gotoTableNumber = c
  }
  let string: String
  let attributes: String
  let gotoTableNumber: Int64
  var description: String {
    return ""
  }

  var first: String {
    get {return string}
  }

  var second: String {
    get {return attributes}
  }

  var third: Int64 {
    get {return gotoTableNumber}
  }
}

class RawScannerReadaheadTable: RawTableWithTransitions, RawTable {
  let type = "ScannerReadaheadTable"
  init(_ a: String, _ b: Int64, _ c: Int64, _ d: [RawScannerReadaheadTriple]) {
    name = a
    stateNumber = b
    size = c
    triples = d
  }
  let name: String
  let stateNumber: Int64
  let size: Int64
  let triples: [RawScannerReadaheadTriple]

  var description: String { return "" }
}

struct RawScannerTables: RawTables {
  // var transducer: Transducer
  init(_ a: Int, _ b: [RawScannerReadaheadTable], _ c: Int, _ d: [RawSemanticTable]) {
    scannerReadaheadTablesSize = a
    scannerReadaheadTables = b
    semanticTablesSize = c
    semanticTables = d
  }
  var scannerReadaheadTablesSize: Int
  var scannerReadaheadTables: [RawScannerReadaheadTable]
  var semanticTablesSize: Int
  var semanticTables: [RawSemanticTable]
  var size: Int {
    get {
      return scannerReadaheadTablesSize + semanticTablesSize
    }
  }
  subscript(index: Int) -> RawTable? {
    // keywords are not indexed
    let bound = [
      scannerReadaheadTablesSize, 
      scannerReadaheadTablesSize + semanticTablesSize, 
    ]
    if index >= 0, index < bound[0] {return scannerReadaheadTables[index]} 
    else if index < bound[1] {return semanticTables[index - bound[0]]} 
    print("RawParserTables: Index out of bound")
    return nil
  }
}
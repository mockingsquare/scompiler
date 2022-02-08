//
//  Scanner.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

// class Table {
//   var transducer: AnyObject? = nil
//   static let sharedEmpty = Table()
//   func run() -> Int { return -1 }  // this should never run
// }

// class AcceptTable: Table {
//   var table: Any? = nil
//   override func run() -> Int { return -1 }
// }

// class SemanticTable: Table {
//   var action: Any? = nil
//   var parameters: Any? = nil
//   var goto: Any? = nil

//   //table:
//   func register(_ table: [Any]) {
//     action = table.first
//     parameters = table[1 ..< (table.endIndex-1)]
//     goto = table.last
//   }
  
//   override func run() -> Int {
//     // if the transducer class can understand action
//     // recipient is `transducer`
//     // else: transducer class cannot understand action
//     // recipient is `transducer sponsor`

//     // recipient performs: action withArguments: parameters
//     return -1
//   }
// }

// // class SwiftbackTable: Table {
// //   var shift: Any? = nil
// //   var goto: Int = -1

// //   //table:
// //   func register(_ table: [Any]) {
// //     shift = table[0]
// //     goto = table[1]
// //   }

// //   override func run() -> Int {
// //     // Adjust left by the amount specified and return the goto table
// //     // st. transducer left: transducer left - shift

// //     return goto
// //   }
// // }

// class TableWithTransitions: Table {
//   var transitions: [SymbolOf:(String, Int)] = [SymbolOf:(String, Int)]()
  
//   func register(_ table: [(SymbolOf, String, Int)]) {
//     for triple in table {
//       transitions[triple.0] = (triple.1, triple.2)
//     }
//   }
// }

// class ReadaheadTable: TableWithTransitions {

// }

// class ReadbackTable: TableWithTransitions {

// }

// class ReduceTable: TableWithTransitions {

// }

// class ScannerReadaheadTable: TableWithTransitions {

// }
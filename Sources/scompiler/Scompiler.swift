//
//  Scompiler.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

struct Scompiler {
  static var hadError = false

  static func main (_ args: [String]) throws {
    if (args.count > 1) {
      print("Usage: scompiler [script]")
    } else if (args.count == 1) {
      //TODO: Make users be able to switch sample translator to another one
      //TODO: Force file extension type .jk
      try Scompiler.runFile(args[0])
    } else {
      try Scompiler.runPrompt()
    }
  } 

  static func runFile(_ path: String) throws {
    let url = URL(fileURLWithPath: path)
    let code = try String(contentsOf: url)
    
    print("[Checkpoint] Running \(code)...")
    
    run(code)

    if hadError { exit(65) }
  }

  static func runPrompt(_ option: Int = 0) throws {
    let ts = SampleTranslator()
    print("\n")

    switch option {
      case 0:
        while true {
            print("> ", terminator: "")
            guard let code = readLine() else { continue }
            ts.compile(text: code)

            hadError = false
        }
      case 1:
        while true {
            print("> ", terminator: "")
            guard let code = readLine() else { continue }
            // ts.evaluate(text: code)

            hadError = false
        }
      default:
        print("(error: not a valid option)")
    }

  }

  static func run(_ code: String) {
    let ts = SampleTranslator()
    ts.compile(text: code)
  }

  static func evaluate(_ code: String) {}

  static func error(_ line: Int, _ message: String) {
    report(line, "", message)
  }

  static func report(_ line: Int, _ `where`: String, _ message: String) {
    print("[line \(line)] Error\(`where`): \(message)")
    hadError = true
  }
}
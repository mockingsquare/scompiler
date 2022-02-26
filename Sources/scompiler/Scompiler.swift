//
//  Scompiler.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

public final class Scompiler {
  public final class Logger {
    public var output: (String) -> Void
    public var error: (String) -> Void

    init() {
      output = {
        Swift.print($0)
      }
      error = {
        var stderr = FileHandle.standardError
        guard let data = $0.data(using: .utf8) else {
          fatalError() // encoding failure: handle as you wish
        }
        stderr.write(data)
      }
    }

    func print(_ text: String) {
      output(text)
    }

    func debug(_ text: String) {
      output("[Debug] \(text)")
    }

    func report(_ text: String) {
      error(text)
    }
  }

  public static var logger = Logger()
  static var hadError = false

  static func main (_ args: [String]) throws {
    if (args.count > 2) {
      print("Usage: scompiler [script]")
    } else if (args.count == 2) {

    } else if (args.count == 1) {
      //TODO: Make users be able to switch sample translator to another one
      //TODO: Force file extension type .jk
      try Scompiler.runFile(args[0])
    } else {
      try Scompiler.runPrompt()
    }
  } 

  static func runFile(_ path: String, _ flag: String = "-c") throws {
    let url = URL(fileURLWithPath: path)

    if url.pathExtension != "jk" {}
    let code = try String(contentsOf: url)
    
    logger.print("[Checkpoint] Running \(url.lastPathComponent)...")
    
    let ts = SampleTranslator()
    if flag == "-c" {
      ts.compile(text: code)
    } else if flag == "-e" {
      // ts.evaluate(text: code)
    }

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

  static func error(_ line: Int, _ message: String) {
    report(line, "", message)
  }

  static func report(_ line: Int, _ `where`: String, _ message: String) {
    print("[line \(line)] Error\(`where`): \(message)")
    hadError = true
  }
}
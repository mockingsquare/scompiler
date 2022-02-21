//
//  Token.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

class Token: TreeNode, Hashable, Equatable {
  var label: String?
  var symbol: String?

  static let sharedEmpty = Token(label: nil, symbol: nil)

  init(label: String?, symbol: String?) {
    self.label = label
    self.symbol = symbol
  }

  public var description: String {
    let l: String = label ?? "NULL"
    let s: String = symbol ?? "NULL"
    return "Token [label: symbol] -> \(l):\(s)"
  }

  static func == (lhs: Token, rhs: Token) -> Bool {
    //mayberemove: this probably is ALREADY forced as lhs and rhs are both Token
    // if typeof(lhs) != typeof(rhs) { return false }
    return lhs.label == rhs.label && lhs.symbol == rhs.symbol
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(label)
    hasher.combine(symbol)
  }
}

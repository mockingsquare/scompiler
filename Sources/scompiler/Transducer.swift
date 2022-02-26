//
//  Transducer.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

import Foundation

class Transducer {
  var sponsor: Translator? = nil
  var tables: [Table] = []
  func performActionWithParameter(action: String, _ param: [Any]) throws -> Void { 
    print("Shouldn't be executed")
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
    if !self.keywords.contains(token.symbol!) {
      return token
    }

    let newToken = Token(label: token.symbol!, symbol: token.symbol!)
    return newToken
  }
}
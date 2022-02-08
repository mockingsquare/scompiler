//
//  Symbol.swift
//  scompiler
//
//  Created by Jeeheon Kim on 07/02/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

enum SymbolOf: String {
  case null,empty
  case identifier, walkIdentifier
  case compilePlus
  case compileMinus
  case compileMultiply
  case compileDivide
  case compileAssign
  case compileIdentifier
  case compileInteger
  case compileFunctionCall
  case compileWhere
  case compilerFunction
}
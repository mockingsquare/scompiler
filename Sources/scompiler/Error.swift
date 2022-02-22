//
//  Error.swift
//  scompiler
//
//  Created by Jeeheon Kim on 07/02/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

enum MyError: Error {
    case runtimeError(String)
}

enum TransducerError: Error {
  case invalidRawTable
  case transducerError // invalid transducer to perform the given task
  case designError(String)
  case lexicalError
  case invalidAction
}

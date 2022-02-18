//
//  Translator.swift
//  scompiler
//
//  Created by Jeeheon Kim on 02-16-2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

// protocol that all user-defined translators have to follow

protocol Translator {
  func performActionWithParameter(action: String, param: [Any]) -> Void
}
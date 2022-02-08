//
//  Tree.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

class Tree: TreeChild {
  var children: [TreeChild] = [TreeChild]()
  var label: String

  init(fromArray: [Any]) throws {
    throw MyError.runtimeError("Need be implemented")
  }

  init(fromOldStyleArray: [Any]) throws {
    throw MyError.runtimeError("Need be implemented")
  }
  override init() {
    label = "Temporary String"
    print("tree initializaer empty")
  }

  func addChild(aTree: TreeChild) {
    children.append(aTree)
  }
  
  // public var description
}
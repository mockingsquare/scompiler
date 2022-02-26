//
//  Tree.swift
//  scompiler
//
//  Created by Jeeheon Kim on 18/01/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//

class Tree: TreeNode {
  var children: [TreeNode] = [TreeNode]()
  var label: String?

  init(fromArray: [Any]) throws {
    throw MyError.runtimeError("Need be implemented")
  }

  init(fromOldStyleArray: [Any]) throws {
    throw MyError.runtimeError("Need be implemented")
  }
  
  init() {
    label = "Temporary String"
    print("tree initializaer empty")
  }

  init(label: String, children: [TreeNode]) {
    self.label = label
    self.children = children
  }

  func addChild(aTree: TreeNode) {
    children.append(aTree)
  }
  
  // public var description
}
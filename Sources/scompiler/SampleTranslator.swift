//
//  SampleTranslator.swift
//  scompiler
//
//  Created by Jeeheon Kim on 08/02/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//
import Foundation

typealias myClosure = (TreeNode) -> Void

class SampleTranslator: Translator {
  var parser: Parser?
  var tree: TreeNode? = nil
  var codeIfCompiler: OutputStream = OutputStream(toMemory: ())
  var expressionsIfEvaluator: [String: Any]?
  var compilationOperatorMap: [String: myClosure]?
  var evaluationOperatorMap: [String: myClosure]?
  func performActionWithParameter(action: String, param: [Any]) -> Void {
    // TODO: for semantic table
  }

  init() {
    /*
    * st.: parser := Parser for: self parserTables: self class rawParserTables scannerTables: self class rawScannerTables
    */
    let table = SampleTranslatorTable()
    parser = Parser(sponsor: self, parserTables: table.rawParserTables, scannerTables: table.rawScannerTables)
    // codeIfCompiler <- not sure what this does
    // codeIfCompiler = TextOutputStream()
    expressionsIfEvaluator = Dictionary() // each key is a variable
    compilationOperatorMap = [
      "+": compilePlus,
      "-": compileMinus,
      "*": compileMultiply,
      "/": compileDivide,
      "<-": compileAssign,
      "Identifier": compileIdentifier,
      "Integer": compileInteger,
      "send": compileFunctionCall,
      "where": compileWhere,
    ]
    evaluationOperatorMap = [
      "+": evaluatePlus,
      "-": evaluateMinus,
      "*": evaluateMultiply,
      "/": evaluateDivide,
      // "<-": "evaluateAssign",
      // "Identifier": "evaluateIdentifier",
      // "Integer": "evaluateInteger",
      // "send": "evaluateFunctionCall",
      // "where": "evaluateWhere",      
    ]
  }

  func compile(text: String) {
    if let p = parser {
      guard p.parse(text) != nil else {return}
      self.tree = p.parse(text)
      if let t = self.tree {
        compileExpressionFor(t)
      } else {
        print("(debug) tree t is not there")
      }
    } else {
      print("(error: parser cannot be unwrapped)")
    }
  }

  func compileExpressionFor(_ tree: TreeNode) {
    let t = tree as! Tree // or is it a token?
    if let operatorMapFunction = compilationOperatorMap?[t.label!] {
      operatorMapFunction(tree)
    }
  }


  func compilePlus(_ tree: TreeNode) -> Void {
    print("need to write compilePlus")
  }

  func compileMinus(_ tree: TreeNode) -> Void {
    print("need to write compileMinus")
  }

  func compileMultiply(_ tree: TreeNode) -> Void{
    let t = tree as! Tree
    compileExpressionFor(t.children[0])
    compileExpressionFor(t.children[1])
    generate(instruction: "MULTIPLY")
  }

  func compileDivide(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    compileExpressionFor(t.children[0])
    compileExpressionFor(t.children[1])
    generate(instruction: "DIVIDE")
  }

  func compileAssign(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    for index in t.children.indices {
      compileExpressionFor(t.children[index])
      generate(instruction: "POP")
    }
  }

  func compileIdentifier(_ tree: TreeNode) -> Void {

  }

  func compileInteger(_ tree: TreeNode) -> Void {

  }

  func compileFunctionCall(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    let childrenIndices: CountableClosedRange = 1...t.children.count
    for index in childrenIndices {
      compileExpressionFor(t.children[index])
    }
    let aToken = t.children[0] as! Token
    generate(instruction: "FUNCTION_CALL", operand: aToken.symbol!)
  }

  func compileWhere(_ tree: TreeNode) -> Void {
    //TODO: [Not implemented] It's ignoring other children
    let aChild = (tree as! Tree).children[0]
    compileExpressionFor(aChild)
  }

  func generate(instruction: String) {
    codeIfCompiler.write(Data(instruction.utf8))
  }

  func generate(instruction: String, operand: String) {
    let str = "\n" + instruction + " "
    codeIfCompiler.write(Data(str.utf8))
  }

  func evaluatePlus(_ tree: TreeNode) -> Void {

  }

  func evaluateMinus(_ tree: TreeNode) -> Void {

  }

  func evaluateMultiply(_ tree: TreeNode) -> Void {
    
  }

  func evaluateDivide(_ tree: TreeNode) -> Void {

  }
}

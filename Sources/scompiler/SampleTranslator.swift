//
//  SampleTranslator.swift
//  scompiler
//
//  Created by Jeeheon Kim on 08/02/2022.
//  Copyright © 2022 Jeeheon Kim. All rights reserved.
//
import Foundation

typealias compileClosure = (TreeNode) -> Void
typealias evaluateClosure = (TreeNode) -> Int

public final class SampleTranslator: Translator {
  var parser: Parser?
  var tree: TreeNode? = nil
  var codeIfCompiler: InputStream = InputStream()
  public final class InputStream {
    public var content: String = ""
    
    final func write(_ text: String){
      content += "\n\(text)"
    }
    
    final func show() {
      Swift.print(content)
    } 
  }
  var expressionsIfEvaluator: [String: Any]?
  var compilationOperatorMap: [String: compileClosure]?
  var evaluationOperatorMap: [String: evaluateClosure]?
  func performActionWithParameter(action: String, _ param: [Any]) -> Void {
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
      "Identifier": evaluateIdentifier,
      "Integer": evaluateInteger,
      // "send": "evaluateFunctionCall",
      "where": evaluateWhere,      
    ]
  }

  func compile(text: String) -> String {
    if let p = parser {
      let lastFromTreeStack = p.parse(text)
      guard lastFromTreeStack != nil else {
        Scompiler.logger.error("CompilationError: lastFromTreeStack missing")
        return ""
      }
      self.tree = lastFromTreeStack
      if let t = self.tree {
        compileExpressionFor(t)
        return codeIfCompiler.content
      } else {
        print("(debug) tree t is not there")
      }
    } else {
      print("(error: parser cannot be unwrapped)")
    }
    return ""
  }

  func compileExpressionFor(_ tree: TreeNode) {
    if let operatorMapFunction = compilationOperatorMap?[tree.label!] {
      operatorMapFunction(tree)
    }
  }


  func compilePlus(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    compileExpressionFor(t.children[0])
    compileExpressionFor(t.children[1])
    generate(instruction: "PLUS")
  }

  func compileMinus(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    compileExpressionFor(t.children[0])
    compileExpressionFor(t.children[1])
    generate(instruction: "MINUS")
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

  func compileIdentifier(_ token: TreeNode) -> Void {
    generate(instruction: "PUSH", with: (token as! Token).symbol!)
  }

  func compileInteger(_ token: TreeNode) -> Void {
    generate(instruction: "PUSH", with: Int((token as! Token).symbol!) ?? -1 )
  }

  func compileFunctionCall(_ tree: TreeNode) -> Void {
    let t = tree as! Tree
    let childrenIndices: CountableClosedRange = 1...t.children.count
    for index in childrenIndices {
      compileExpressionFor(t.children[index])
    }
    let aToken = t.children[0] as! Token
    generate(instruction: "FUNCTION_CALL", with: aToken.symbol!)
  }

  func compileWhere(_ tree: TreeNode) -> Void {
    //TODO: [Not implemented] It's ignoring other children
    let t = tree as! Tree
    for child in t.children {
      compileExpressionFor(child)
    }
  }

  func generate(instruction: String) {
    codeIfCompiler.write("\(instruction)\n")
  }

  func generate(instruction: String, with: String) {
    let str = "\(instruction) \(with)\n"
    codeIfCompiler.write(str)
  }
  
  func generate(instruction: String, with: Int) {
    let str = "\(instruction) \(with)\n"
    codeIfCompiler.write(str)
  }

  func evaluate(text: String) -> Any? {
    // If not variables are set up, just return the expression
    // Otherwise, return a dictionary of variables
    if let p = parser {
      let lastFromTreeStack = p.parse(text)
      guard lastFromTreeStack != nil else {
        Scompiler.logger.debug("parser returned nil")
        return nil
      }
      self.tree = lastFromTreeStack
      if let t = self.tree {
        let result = evaluateExpressionFor(t) // see result and variable dictionary
        if expressionsIfEvaluator!.count == 0 {
          return result
        } else {
          return expressionsIfEvaluator
        }
      } else {
        print("(debug) tree t is not there")
      }
    } else {
      print("(error: parser cannot be unwrapped)")
    }
    return nil
  }

  func evaluateExpressionFor(_ tree: TreeNode) -> Int {
    return evaluationOperatorMap![tree.label!]!(tree)
  }

  func evaluatePlus(_ tree: TreeNode) -> Int {
    let t = tree as! Tree
    let exp1 = evaluateExpressionFor(t.children[0])
    let exp2 = evaluateExpressionFor(t.children[1])
    return exp1 + exp2  
  }

  func evaluateMinus(_ tree: TreeNode) -> Int {
    let t = tree as! Tree
    let exp1 = evaluateExpressionFor(t.children[0])
    let exp2 = evaluateExpressionFor(t.children[1])
    return exp1 - exp2  
  }

  func evaluateMultiply(_ tree: TreeNode) -> Int {
    let t = tree as! Tree
    let exp1 = evaluateExpressionFor(t.children[0])
    let exp2 = evaluateExpressionFor(t.children[1])
    return exp1 * exp2
  }

  func evaluateDivide(_ tree: TreeNode) -> Int {
    let t = tree as! Tree
    let exp1 = evaluateExpressionFor(t.children[0])
    let exp2 = evaluateExpressionFor(t.children[1])
    return exp1 / exp2
  }

  func evaluateIdentifier(_ token: TreeNode) -> Int {
    let t = token as! Token

    let identifier = t.symbol!
    let value = expressionsIfEvaluator![identifier] as! Int

    return value
  }

  func evaluateInteger(_ token: TreeNode) -> Int {
    let t = token as! Token
    return Int(t.symbol! as! String)!
  }

  func evaluateWhere(_ tree: TreeNode) -> Int {
    // 1. Evaluate all but the first expression to obtain the values for individual variables
    // 2. Store them in expressionsIfEvaluator and finally evaluate the first expression
    let t = tree as! Tree
    if t.children.count < 2 {
      Scompiler.logger.error("Evaluatewhere: tree should have more than one child")
    }

    // MARK: Assumes that children count is even
    // Identifier, treeNode, Identifier, treeNode,.. 
    for idx in stride(from:1 , to: t.children.count-1, by: 2) {
      // Evaluate except the first child
      let i = t.children[idx] as! Token
      let value = evaluateExpressionFor(t.children[idx+1])
      expressionsIfEvaluator![i.symbol!] = value
    }
    
    let finalValue = evaluateExpressionFor(t.children[0])
    return finalValue
  }
}

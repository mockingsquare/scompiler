struct SampleTranslatorTable{
  /******************************
    *                            *
    * SETTING UP READAHEAD TABLE *
    *                            *
    ******************************/    
  static let keywords: [String] = ["where"]

  static let ra0: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 1),
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Primary", "RSN", 37), 
    RawReadaheadTriple("Integer", "RSN", 38), 
    RawReadaheadTriple("Identifier", "RSN", 3), 
    RawReadaheadTriple("Grammar", "RSN", 62), 
    RawReadaheadTriple("(", "RS", 4)
  ]

  static let ra1: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 5), 
    RawReadaheadTriple("-", "RS", 6), 
    RawReadaheadTriple("where", "RS", 7), 
    RawReadaheadTriple("-|", "L", 35)
  ]

  static let ra2: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 8), 
    RawReadaheadTriple("/", "RS", 9), 
    RawReadaheadTriple("+", "L", 36), 
    RawReadaheadTriple("-", "L", 36), 
    RawReadaheadTriple("where", "L", 36), 
    RawReadaheadTriple("-|", "L", 36), 
    RawReadaheadTriple(";", "L", 36), 
    RawReadaheadTriple(")", "L", 36), 
    RawReadaheadTriple(",", "L", 36)
  ]

  static let ra3: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 10), 
    RawReadaheadTriple("=", "RS", 11), 
    RawReadaheadTriple("+", "L", 38),
    RawReadaheadTriple("-", "L", 38), 
    RawReadaheadTriple("*", "L", 38),
    RawReadaheadTriple("/", "L", 38),
    RawReadaheadTriple("where", "L", 38),
    RawReadaheadTriple("-|", "L", 38),
    RawReadaheadTriple(";", "L", 38),
    RawReadaheadTriple(")", "L", 38),
    RawReadaheadTriple(",", "L", 38)
  ]

  static let ra4: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 12),
    RawReadaheadTriple("Primary", "RSN", 37),
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Identifier", "RSN", 13),
    RawReadaheadTriple("(", "RS", 4)
  ]
  
  static let ra5: [RawReadaheadTriple] = [
    RawReadaheadTriple("Identifier", "RSN", 13), 
    RawReadaheadTriple("(", "RS", 4), 
    RawReadaheadTriple("Integer", "RSN", 38), 
    RawReadaheadTriple("Primary", "RSN", 37), 
    RawReadaheadTriple("Term", "RSN", 14)
  ]

  static let ra6: [RawReadaheadTriple] = [
    RawReadaheadTriple("Identifier", "RSN", 13),
    RawReadaheadTriple("(", "RS", 4),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Primary", "RSN", 37),
    RawReadaheadTriple("Term", "RSN", 15)
  ]
  
  static let ra7: [RawReadaheadTriple] = [RawReadaheadTriple("Identifier", "RSN", 16)]
  static let ra8: [RawReadaheadTriple] = [
    RawReadaheadTriple("Identifier", "RSN", 13), 
    RawReadaheadTriple("(", "RS", 4),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Primary", "RSN", 42)
  ]
  static let ra9: [RawReadaheadTriple]  = [
    RawReadaheadTriple("Identifier", "RSN", 13),
    RawReadaheadTriple("(", "RS", 4), 
    RawReadaheadTriple("Integer", "RSN", 38), 
    RawReadaheadTriple("Primary", "RSN", 43)
  ]
  static let ra10: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 17),
    RawReadaheadTriple(")", "RS", 44),
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Primary", "RSN", 37),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Identifier", "RSN", 13), 
    RawReadaheadTriple("(", "RS", 4)
  ]
  static let ra11: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 18),
    RawReadaheadTriple("Primary", "RSN", 37), 
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Integer", "RSN", 38), 
    RawReadaheadTriple("Identifier", "RSN", 13), 
    RawReadaheadTriple("(", "RS", 4),
  ]
  
  static let ra12: [RawReadaheadTriple] = [
    RawReadaheadTriple(")", "RS", 39),
    RawReadaheadTriple("+", "RS", 5),
    RawReadaheadTriple("-", "RS", 6)
  ]

  static let ra13: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 10), 
    RawReadaheadTriple("+", "L", 38),
    RawReadaheadTriple("-", "L", 38), 
    RawReadaheadTriple("*", "L", 38),
    RawReadaheadTriple("/", "L", 38),
    RawReadaheadTriple("where", "L", 38), 
    RawReadaheadTriple("-|", "L", 38), 
    RawReadaheadTriple(";", "L", 38),
    RawReadaheadTriple(")", "L", 38),
    RawReadaheadTriple(",", "L", 38)
  ]
  static let ra14: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 8),
    RawReadaheadTriple("/", "RS", 9),
    RawReadaheadTriple("+", "L", 40),
    RawReadaheadTriple("-", "L", 40),
    RawReadaheadTriple("where", "L", 40),
    RawReadaheadTriple("-|", "L", 40),
    RawReadaheadTriple(";", "L", 40),
    RawReadaheadTriple(")", "L", 40),
    RawReadaheadTriple(",", "L", 40)
  ]
  static let ra15: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 8),
    RawReadaheadTriple("/", "RS", 9),
    RawReadaheadTriple("+", "L", 41), 
    RawReadaheadTriple("-", "L", 41),
    RawReadaheadTriple("where", "L", 41),
    RawReadaheadTriple("-|", "L", 41),
    RawReadaheadTriple(";", "L", 41), 
    RawReadaheadTriple(")", "L", 41), 
    RawReadaheadTriple(",", "L", 41)
  ]
  static let ra16: [RawReadaheadTriple] = [RawReadaheadTriple("=", "RS", 19)]
  static let ra17: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 5), 
    RawReadaheadTriple("-", "RS", 6),
    RawReadaheadTriple(",", "RS", 20),
    RawReadaheadTriple(")", "RS", 44)
  ]
  static let ra18: [RawReadaheadTriple] = [
    RawReadaheadTriple(";", "RS", 21),
    RawReadaheadTriple("+", "RS", 5),
    RawReadaheadTriple("-", "RS", 6)
  ]
  
  static let ra19: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 22), 
    RawReadaheadTriple("Primary", "RSN", 37),
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Identifier", "RSN", 13),
    RawReadaheadTriple("(", "RS", 4)
  ]

  static let ra20: [RawReadaheadTriple] = [
    RawReadaheadTriple("Expression", "RSN", 23),
    RawReadaheadTriple("Primary", "RSN", 37),
    RawReadaheadTriple("Term", "RSN", 2),
    RawReadaheadTriple("Integer", "RSN", 38),
    RawReadaheadTriple("Identifier", "RSN", 13),
    RawReadaheadTriple("(", "RS", 4)
  ]

  static let ra21: [RawReadaheadTriple] = [
    RawReadaheadTriple("Identifier", "RSN", 24),
    RawReadaheadTriple("-|", "L", 45)
  ]
  static let ra22: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 5), 
    RawReadaheadTriple("-", "RS", 6), 
    RawReadaheadTriple(";", "RS", 25)
  ]
  
  static let ra23: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 5), 
    RawReadaheadTriple("-", "RS", 6), 
    RawReadaheadTriple(",", "RS", 20), 
    RawReadaheadTriple(")", "RS", 44)
  ]
  static let ra24: [RawReadaheadTriple] = [RawReadaheadTriple("=", "RS", 11)]
  static let ra25: [RawReadaheadTriple] = [
    RawReadaheadTriple("Identifier", "RSN", 16),
    RawReadaheadTriple("-|", "L", 46)
  ]

  static let readaheadTables: [RawReadaheadTable] = [  
    RawReadaheadTable("ReadaheadTable", 0, 7, ra0), 
    RawReadaheadTable("ReadaheadTable", 1, 4, ra1), 
    RawReadaheadTable("ReadaheadTable", 2, 9, ra2), 
    RawReadaheadTable("ReadaheadTable", 3, 11, ra3), 
    RawReadaheadTable("ReadaheadTable", 4, 6, ra4), 
    RawReadaheadTable("ReadaheadTable", 5, 5, ra5), 
    RawReadaheadTable("ReadaheadTable", 6, 5, ra6), 
    RawReadaheadTable("ReadaheadTable", 7, 1, ra7), 
    RawReadaheadTable("ReadaheadTable", 8, 4, ra8), 
    RawReadaheadTable("ReadaheadTable", 9, 4, ra9), 
    RawReadaheadTable("ReadaheadTable", 10, 7, ra10), 
    RawReadaheadTable("ReadaheadTable", 11, 6, ra11), 
    RawReadaheadTable("ReadaheadTable", 12, 3, ra12), 
    RawReadaheadTable("ReadaheadTable", 13, 10, ra13), 
    RawReadaheadTable("ReadaheadTable", 14, 9, ra14), 
    RawReadaheadTable("ReadaheadTable", 15, 9, ra15), 
    RawReadaheadTable("ReadaheadTable", 16, 1, ra16), 
    RawReadaheadTable("ReadaheadTable", 17, 4, ra17), 
    RawReadaheadTable("ReadaheadTable", 18, 3, ra18), 
    RawReadaheadTable("ReadaheadTable", 19, 6, ra19), 
    RawReadaheadTable("ReadaheadTable", 20, 6, ra20), 
    RawReadaheadTable("ReadaheadTable", 21, 2, ra21), 
    RawReadaheadTable("ReadaheadTable", 22, 3, ra22), 
    RawReadaheadTable("ReadaheadTable", 23, 4, ra23), 
    RawReadaheadTable("ReadaheadTable", 24, 1, ra24), 
    RawReadaheadTable("ReadaheadTable", 25, 2, ra25),
  ]

  /******************************
    *                            *
    * SETTING UP READBACK TABLE  *
    *                            *
    ******************************/    
  static let rb26: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression", 23), "RSN", 48),
    RawReadbackTriple(("Expression", 17), "RSN", 49),
    RawReadbackTriple(("(", 10), "RS", 31)
  ]
  
  static let rb27: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression", 12), "RSN", 55), 
    RawReadbackTriple(("Expression", 22), "RSN", 55), 
    RawReadbackTriple(("Expression", 23), "RSN", 55), 
    RawReadbackTriple(("Expression", 1), "RSN", 55), 
    RawReadbackTriple(("Expression", 17), "RSN", 55), 
    RawReadbackTriple(("Expression", 18), "RSN", 55)
  ]

  static let rb28: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression", 12), "RSN", 56), 
    RawReadbackTriple(("Expression", 22), "RSN", 56), 
    RawReadbackTriple(("Expression", 23), "RSN", 56), 
    RawReadbackTriple(("Expression", 1), "RSN", 56), 
    RawReadbackTriple(("Expression", 17), "RSN", 56), 
    RawReadbackTriple(("Expression", 18), "RSN", 56)
  ]
  static let rb29: [RawReadbackTriple] = [
    RawReadbackTriple(("Term", 14), "RSN", 57), 
    RawReadbackTriple(("Term", 15), "RSN", 57), 
    RawReadbackTriple(("Term", 2), "RSN", 57)
  ]
  
  static let rb30: [RawReadbackTriple] = [
    RawReadbackTriple(("Term", 14), "RSN", 58), 
    RawReadbackTriple(("Term", 15), "RSN", 58), 
    RawReadbackTriple(("Term", 2), "RSN", 58)
  ]

  static let rb31: [RawReadbackTriple] = [
    RawReadbackTriple(("Identifier", 13), "RSN", 59), 
    RawReadbackTriple(("Identifier", 3), "RSN", 59),
  ]

  static let rb32: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression", 23), "RSN", 48), 
    RawReadbackTriple(("Expression", 17), "RSN", 49)
  ]

  static let rb33: [RawReadbackTriple] = [
    RawReadbackTriple(("Identifier", 24), "RSN", 45), 
    RawReadbackTriple(("Identifier", 3), "RSN", 60)
  ]

  static let rb34: [RawReadbackTriple] = [
    RawReadbackTriple((";", 25), "RS", 47),
    RawReadbackTriple(("where", 7), "RS", 50)
  ]

  // Define an array of readback table
  static let readbackTables: [RawReadbackTable] = [
    RawReadbackTable("ReadbackTable", 26, 3, rb26), 
    RawReadbackTable("ReadbackTable", 27, 6, rb27), 
    RawReadbackTable("ReadbackTable", 28, 6, rb28), 
    RawReadbackTable("ReadbackTable", 29, 3, rb29), 
    RawReadbackTable("ReadbackTable", 30, 3, rb30), 
    RawReadbackTable("ReadbackTable", 31, 2, rb31), 
    RawReadbackTable("ReadbackTable", 32, 2, rb32), 
    RawReadbackTable("ReadbackTable", 33, 2, rb33),
    RawReadbackTable("ReadbackTable", 34, 2, rb34) 
  ]

  /******************************
    *                            *
    * SETTING UP SHIFTBACK TABLE *
    *                            *
    ******************************/          
  static let shiftbackTables: [RawShiftbackTable] = [
    RawShiftbackTable("ShiftbackTable", 35, 1, 52), 
    RawShiftbackTable("ShiftbackTable", 36, 1, 51), 
    RawShiftbackTable("ShiftbackTable", 37, 1, 53), 
    RawShiftbackTable("ShiftbackTable", 38, 1, 54), 
    RawShiftbackTable("ShiftbackTable", 39, 3, 54), 
    RawShiftbackTable("ShiftbackTable", 40, 2, 27), 
    RawShiftbackTable("ShiftbackTable", 41, 2, 28), 
    RawShiftbackTable("ShiftbackTable", 42, 2, 29), 
    RawShiftbackTable("ShiftbackTable", 43, 2, 30), 
    RawShiftbackTable("ShiftbackTable", 44, 1, 26), 
    RawShiftbackTable("ShiftbackTable", 45, 3, 33), 
    RawShiftbackTable("ShiftbackTable", 46, 4, 34), 
    RawShiftbackTable("ShiftbackTable", 47, 3, 34), 
    RawShiftbackTable("ShiftbackTable", 48, 1, 32), 
    RawShiftbackTable("ShiftbackTable", 49, 1, 31), 
    RawShiftbackTable("ShiftbackTable", 50, 1, 61)
  ]

  /*******************************
    *                            *
    * SETTING UP REDUCE TABLE    *
    *                            *
    ******************************/      
  static let rd51: [RawReduceTriple] = [
    RawReduceTriple(0, "RSN", 1), 
    RawReduceTriple(4, "RSN", 12), 
    RawReduceTriple(10, "RSN", 17), 
    RawReduceTriple(11, "RSN", 18), 
    RawReduceTriple(19, "RSN", 22), 
    RawReduceTriple(20, "RSN", 23)
  ]
  static let rd52: [RawReduceTriple] = [RawReduceTriple(0, "RSN", 62)]
  static let rd53: [RawReduceTriple] = [
    RawReduceTriple(0, "RSN", 2), 
    RawReduceTriple(4, "RSN", 2), 
    RawReduceTriple(5, "RSN", 14), 
    RawReduceTriple(6, "RSN", 15),
    RawReduceTriple(10, "RSN", 2), 
    RawReduceTriple(11, "RSN", 2), 
    RawReduceTriple(19, "RSN", 2), 
    RawReduceTriple(20, "RSN", 2)
  ]
  static let rd54: [RawReduceTriple] = [
    RawReduceTriple(0, "RSN", 37), 
    RawReduceTriple(4, "RSN", 37), 
    RawReduceTriple(5, "RSN", 37), 
    RawReduceTriple(6, "RSN", 37), 
    RawReduceTriple(8, "RSN", 42), 
    RawReduceTriple(9, "RSN", 43), 
    RawReduceTriple(10, "RSN", 37), 
    RawReduceTriple(11, "RSN", 37), 
    RawReduceTriple(19, "RSN", 37), 
    RawReduceTriple(20, "RSN", 37)
  ]

  static let reduceTables: [RawReduceTable] = [
    RawReduceTable("ReduceTable", 51, "Expression", 6, rd51), 
    RawReduceTable("ReduceTable", 52, "Grammar", 1, rd52), 
    RawReduceTable("ReduceTable", 53, "Term", 8, rd53), 
    RawReduceTable("ReduceTable", 54, "Primary", 10, rd54)
  ]

  /*******************************
    *                            *
    * SETTING UP SEMANTIC TABLE  *
    *                            *
    ******************************/      
  static let p55: [String] = ["+"]
  static let p56: [String] = ["-"]
  static let p57: [String] = ["*"]
  static let p58: [String] = ["/"]
  static let p59: [String] = ["send"]
  static let p60: [String] = ["<-"]
  static let p61: [String] = ["where"]

  static let semanticTables: [RawSemanticTable] = [
    RawSemanticTable("SemanticTable", 55, "buildTree", 1, p55, 51), 
    RawSemanticTable("SemanticTable", 56, "buildTree", 1, p56, 51), 
    RawSemanticTable("SemanticTable", 57, "buildTree", 1, p57, 53), 
    RawSemanticTable("SemanticTable", 58, "buildTree", 1, p58, 53), 
    RawSemanticTable("SemanticTable", 59, "buildTree", 1, p59, 54), 
    RawSemanticTable("SemanticTable", 60, "buildTree", 1, p60, 52), 
    RawSemanticTable("SemanticTable", 61, "buildTree", 1, p61, 52)    
  ]

  static let acceptTable: RawAcceptTable = RawAcceptTable("AcceptTable", 62)

  // let parserTables: ParserTable = ParserTables()
  let rawParserTables: RawParserTables = RawParserTables(
    1, keywords,
    26, readaheadTables,
    9, readbackTables,
    16, shiftbackTables,
    4, reduceTables,
    7, semanticTables,
    acceptTable      
  )

  /******************************
    *                            *
    * SETTING UP SCANNER TABLES  *
    *                            *
    ******************************/
  static var t0: [RawScannerReadaheadTriple] = [
    RawScannerReadaheadTriple(Array("\0"), "L", 4),  //MARK: should be end of file; not sure if I should put it nil
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz"), "RK", 2),
    RawScannerReadaheadTriple(Array(")"), "RK", 6),
    RawScannerReadaheadTriple(Array("*"), "RK", 7), 
    RawScannerReadaheadTriple(Array("+"), "RK", 8),
    RawScannerReadaheadTriple(Array(","), "RK", 9), 
    RawScannerReadaheadTriple(Array("-"), "RK", 10), 
    RawScannerReadaheadTriple(Array("("), "RK", 5), 
    RawScannerReadaheadTriple(Array("/"), "RK", 11), 
    RawScannerReadaheadTriple(Array("0123456789"), "RK", 1), 
    RawScannerReadaheadTriple([11, 12, 14, 15], "R", 3), 
    RawScannerReadaheadTriple(Array(" "), "R", 3), 
    RawScannerReadaheadTriple(Array(";"), "RK", 13), 
    RawScannerReadaheadTriple(Array("="), "RK", 14),
  ]
   
  static var t1: [RawScannerReadaheadTriple] = [
    RawScannerReadaheadTriple([11, 12, 14, 15], "L", 12), 
    RawScannerReadaheadTriple(Array("\0"), "L", 12), 
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_+-*/=[]{}()^;#:.$'\" "), "L", 12), 
    RawScannerReadaheadTriple(Array("0123456789"), "RK", 1)
  ]
  static var t2: [RawScannerReadaheadTriple] = [
    RawScannerReadaheadTriple([11, 12, 14, 15], "L", 15), 
    RawScannerReadaheadTriple(Array("\0"), "L", 15), 
    RawScannerReadaheadTriple(Array("+-*/=[]{}()^;#:.$'\" "), "L", 15), 
    RawScannerReadaheadTriple(Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz"), "RK", 2)
  ]
  static var t3: [RawScannerReadaheadTriple] = [
    RawScannerReadaheadTriple(Array("\0"), "L", 0),
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/=[]{}()^;#:.$'\""), "L", 0),
    RawScannerReadaheadTriple([11, 12, 14, 15], "R", 3), 
    RawScannerReadaheadTriple(Array(" "), "R", 3)
  ]
  static var scannerReadaheadTables: [RawScannerReadaheadTable] = [
    RawScannerReadaheadTable("ScannerReadaheadTable", 0, 14, t0), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 1, 4, t1), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 2, 4, t2), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 3, 4, t3)
  ]

  //Define VARIABLES to refer to semantic table PARAMETERs.
  //FORMAT {string0, string1, ...} 
  static var p4: [String] = ["-|"]
  static var p5: [String] = ["("]
  static var p6: [String] = [")"]
  static var p7: [String] = ["*"]
  static var p8: [String] = ["+"]
  static var p9: [String] = [","]
  static var p10: [String] = ["-"]
  static var p11: [String] = ["/"]
  static var p12: [String] = ["Integer"]
  static var p13: [String] = [";"]
  static var p14: [String] = ["="]
  static var p15: [String] = ["Identifier"]

  //Define an array of semantic tables.
  //FORMAT SemanticTable {const char *name; long stateNumber; const char *action; long size; const char **parameters; long gotoTableNumber;}
  static var scannerSemanticTables: [RawSemanticTable] = [
    RawSemanticTable("SemanticTable", 4, "buildToken", 1, p4, 0), 
    RawSemanticTable("SemanticTable", 5, "buildToken", 1, p5, 0), 
    RawSemanticTable("SemanticTable", 6, "buildToken", 1, p6, 0), 
    RawSemanticTable("SemanticTable", 7, "buildToken", 1, p7, 0), 
    RawSemanticTable("SemanticTable", 8, "buildToken", 1, p8, 0), 
    RawSemanticTable("SemanticTable", 9, "buildToken", 1, p9, 0), 
    RawSemanticTable("SemanticTable", 10, "buildToken", 1, p10, 0), 
    RawSemanticTable("SemanticTable", 11, "buildToken", 1, p11, 0), 
    RawSemanticTable("SemanticTable", 12, "buildToken", 1, p12, 0), 
    RawSemanticTable("SemanticTable", 13, "buildToken", 1, p13, 0), 
    RawSemanticTable("SemanticTable", 14, "buildToken", 1, p14, 0), 
    RawSemanticTable("SemanticTable", 15, "buildToken", 1, p15, 0)
  ]

  var rawScannerTables: RawScannerTables = RawScannerTables(
    4, scannerReadaheadTables,
    12, scannerSemanticTables
  )
}
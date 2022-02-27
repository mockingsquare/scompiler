struct StudentTranslatorTable{
  /******************************
    *                            *
    * SETTING UP READAHEAD TABLE *
    *                            *
    ******************************/    
  static let keywords: [String] = ["if for else"]

  static let ra0: [RawReadaheadTriple] = [
    RawReadaheadTriple("for", "RS", 3),
    RawReadaheadTriple("(", "RS", 5),
    RawReadaheadTriple("walkInteger", "RSN", 67),
    RawReadaheadTriple("walkIdentifier", "RSN", 6),
    RawReadaheadTriple("if", "RS", 7),
    RawReadaheadTriple("}", "L", 51),
    RawReadaheadTriple("-|", "L", 51)
  ]

  static let ra1: [RawReadaheadTriple] = [
    RawReadaheadTriple("if", "RS", 7),
    RawReadaheadTriple("walkIdentifier", "RSN", 6),
    RawReadaheadTriple("for", "RS", 3),
    RawReadaheadTriple("walkInteger", "RSN", 67),
    RawReadaheadTriple("(", "RS", 5),
    RawReadaheadTriple("}", "L", 51),
    RawReadaheadTriple("-|", "L", 51)
  ]

  static let ra2: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 10),
    RawReadaheadTriple("/", "RS", 11),
    RawReadaheadTriple("+", "L", 65),
    RawReadaheadTriple("-", "L", 65),
    RawReadaheadTriple("<", "L", 65),
    RawReadaheadTriple(">", "L", 65),
    RawReadaheadTriple("==", "L", 65),
    RawReadaheadTriple("?", "L", 65),
    RawReadaheadTriple(")", "L", 65),
    RawReadaheadTriple(",", "L", 65),
    RawReadaheadTriple(";", "L", 65),
    RawReadaheadTriple(":", "L", 65)
  ]

  static let ra3: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 12)
  ]

  static let ra4: [RawReadaheadTriple] = [
    RawReadaheadTriple("<", "RS", 13),
    RawReadaheadTriple(">", "RS", 14),
    RawReadaheadTriple("==", "RS", 15),
    RawReadaheadTriple("?", "RS", 16),
    RawReadaheadTriple(")", "L", 66),
    RawReadaheadTriple(",", "L", 66),
    RawReadaheadTriple(";", "L", 66)
  ]

  static let ra5: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 6),
    RawReadaheadTriple("walkInteger", "RSN", 67),
    RawReadaheadTriple("(", "RS", 5)
  ]

  static let ra6: [RawReadaheadTriple] = [
    RawReadaheadTriple("=", "RS", 18),
    RawReadaheadTriple("(", "RS", 19),
    RawReadaheadTriple("*", "L", 67),
    RawReadaheadTriple("/", "L", 67),
    RawReadaheadTriple("+", "L", 67),
    RawReadaheadTriple("-", "L", 67),
    RawReadaheadTriple("<", "L", 67),
    RawReadaheadTriple(">", "L", 67),
    RawReadaheadTriple("==", "L", 67),
    RawReadaheadTriple("?", "L", 67),
    RawReadaheadTriple(")", "L", 67),
    RawReadaheadTriple(",", "L", 67),
    RawReadaheadTriple(";", "L", 67),
    RawReadaheadTriple(":", "L", 67)
  ]

  static let ra7: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 20)
  ]

  static let ra8: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 21), 
    RawReadaheadTriple("-", "RS", 22), 
    RawReadaheadTriple("<", "L", 69), 
    RawReadaheadTriple(">", "L", 69), 
    RawReadaheadTriple("==", "L", 69), 
    RawReadaheadTriple("?", "L", 69), 
    RawReadaheadTriple(")", "L", 69), 
    RawReadaheadTriple(",", "L", 69), 
    RawReadaheadTriple(";", "L", 69), 
    RawReadaheadTriple(":", "L", 69),  
  ]

  static let ra9: [RawReadaheadTriple] = [
    RawReadaheadTriple(";", "RS", 70)
  ]

  static let ra10: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("walkIdentifier", "RSN", 23)
  ]

  static let ra11: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("walkIdentifier", "RSN", 23)
  ]

  static let ra12: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67)  
  ]

  static let ra13: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5)  
  ]

  static let ra14: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5)  
  ]

  static let ra15: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5)  
  ]

  static let ra16: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5)
  ]

  static let ra17: [RawReadaheadTriple] = [
    RawReadaheadTriple(")", "RS", 71)
  ]

  static let ra18: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
    RawReadaheadTriple("(", "RS", 5),
  ]

  static let ra19: [RawReadaheadTriple] = [
    RawReadaheadTriple(")", "RS", 78), 
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra20: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra21: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra22: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra23: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 19), 
    RawReadaheadTriple("*", "L", 67), 
    RawReadaheadTriple("/", "L", 67), 
    RawReadaheadTriple("+", "L", 67), 
    RawReadaheadTriple("-", "L", 67), 
    RawReadaheadTriple("<", "L", 67), 
    RawReadaheadTriple(">", "L", 67), 
    RawReadaheadTriple("==", "L", 67), 
    RawReadaheadTriple("?", "L", 67), 
    RawReadaheadTriple(")", "L", 67), 
    RawReadaheadTriple(",", "L", 67), 
    RawReadaheadTriple(";", "L", 67), 
    RawReadaheadTriple(":", "L", 67),
  ]

  static let ra24: [RawReadaheadTriple] = [
    RawReadaheadTriple(";", "RS", 33),
  ]

  static let ra25: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 21), 
    RawReadaheadTriple("-", "RS", 22), 
    RawReadaheadTriple("<", "L", 74), 
    RawReadaheadTriple(">", "L", 74), 
    RawReadaheadTriple("==", "L", 74), 
    RawReadaheadTriple("?", "L", 74), 
    RawReadaheadTriple(")", "L", 74), 
    RawReadaheadTriple(",", "L", 74), 
    RawReadaheadTriple(";", "L", 74), 
    RawReadaheadTriple(":", "L", 74),
  ]

  static let ra26: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 21), 
    RawReadaheadTriple("-", "RS", 22), 
    RawReadaheadTriple("<", "L", 75), 
    RawReadaheadTriple(">", "L", 75), 
    RawReadaheadTriple("==", "L", 75), 
    RawReadaheadTriple("?", "L", 75), 
    RawReadaheadTriple(")", "L", 75), 
    RawReadaheadTriple(",", "L", 75), 
    RawReadaheadTriple(";", "L", 75), 
    RawReadaheadTriple(":", "L", 75),
  ]

  static let ra27: [RawReadaheadTriple] = [
    RawReadaheadTriple("+", "RS", 21), 
    RawReadaheadTriple("-", "RS", 22), 
    RawReadaheadTriple("<", "L", 76), 
    RawReadaheadTriple(">", "L", 76), 
    RawReadaheadTriple("==", "L", 76), 
    RawReadaheadTriple("?", "L", 76), 
    RawReadaheadTriple(")", "L", 76), 
    RawReadaheadTriple(",", "L", 76), 
    RawReadaheadTriple(";", "L", 76), 
    RawReadaheadTriple(":", "L", 76),
  ]

  static let ra28: [RawReadaheadTriple] = [
    RawReadaheadTriple("<", "RS", 13), 
    RawReadaheadTriple(">", "RS", 14), 
    RawReadaheadTriple("==", "RS", 15), 
    RawReadaheadTriple(":", "RS", 34),
  ]

  static let ra29: [RawReadaheadTriple] = [
    RawReadaheadTriple(",", "RS", 35), 
    RawReadaheadTriple(")", "RS", 78),
  ]

  static let ra30: [RawReadaheadTriple] = [
    RawReadaheadTriple(")", "RS", 36),
  ]

  static let ra31: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 10), 
    RawReadaheadTriple("/", "RS", 11), 
    RawReadaheadTriple("+", "L", 79), 
    RawReadaheadTriple("-", "L", 79), 
    RawReadaheadTriple("<", "L", 79), 
    RawReadaheadTriple(">", "L", 79), 
    RawReadaheadTriple("==", "L", 79), 
    RawReadaheadTriple("?", "L", 79), 
    RawReadaheadTriple(")", "L", 79), 
    RawReadaheadTriple(",", "L", 79), 
    RawReadaheadTriple(";", "L", 79), 
    RawReadaheadTriple(":", "L", 79),
  ]

  static let ra32: [RawReadaheadTriple] = [
    RawReadaheadTriple("*", "RS", 10), 
    RawReadaheadTriple("/", "RS", 11), 
    RawReadaheadTriple("+", "L", 80), 
    RawReadaheadTriple("-", "L", 80), 
    RawReadaheadTriple("<", "L", 80), 
    RawReadaheadTriple(">", "L", 80), 
    RawReadaheadTriple("==", "L", 80), 
    RawReadaheadTriple("?", "L", 80), 
    RawReadaheadTriple(")", "L", 80), 
    RawReadaheadTriple(",", "L", 80), 
    RawReadaheadTriple(";", "L", 80), 
    RawReadaheadTriple(":", "L", 80),
  ]

  static let ra33: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra34: [RawReadaheadTriple] = [
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 23), 
    RawReadaheadTriple("walkInteger", "RSN", 67),
  ]

  static let ra35: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5),
  ]

  static let ra36: [RawReadaheadTriple] = [
    RawReadaheadTriple("{", "RS", 40),
  ]

  static let ra37: [RawReadaheadTriple] = [
    RawReadaheadTriple(";", "RS", 41),
  ]

  static let ra38: [RawReadaheadTriple] = [
    RawReadaheadTriple("<", "RS", 13), 
    RawReadaheadTriple(">", "RS", 14), 
    RawReadaheadTriple("==", "RS", 15), 
    RawReadaheadTriple(")", "L", 81), 
    RawReadaheadTriple(",", "L", 81), 
    RawReadaheadTriple(";", "L", 81),
  ]

  static let ra39: [RawReadaheadTriple] = [
    RawReadaheadTriple(",", "RS", 35), 
    RawReadaheadTriple(")", "RS", 78),
  ]

  static let ra40: [RawReadaheadTriple] = [
    RawReadaheadTriple("for", "RS", 3), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("if", "RS", 7), 
    RawReadaheadTriple("}", "L", 51), 
    RawReadaheadTriple("-|", "L", 51),
  ]

  static let ra41: [RawReadaheadTriple] = [
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("(", "RS", 5),
  ]

  static let ra42: [RawReadaheadTriple] = [
    RawReadaheadTriple("}", "RS", 44),
  ]

  static let ra43: [RawReadaheadTriple] = [
    RawReadaheadTriple(")", "RS", 45),
  ]

  static let ra44: [RawReadaheadTriple] = [
    RawReadaheadTriple("else", "RS", 46), 
    RawReadaheadTriple("if", "L", 52), 
    RawReadaheadTriple("for", "L", 52), 
    RawReadaheadTriple("walkInteger", "L", 52), 
    RawReadaheadTriple("walkIdentifier", "L", 52), 
    RawReadaheadTriple("(", "L", 52), 
    RawReadaheadTriple("}", "L", 52), 
    RawReadaheadTriple("-|", "L", 52),
  ]

  static let ra45: [RawReadaheadTriple] = [
    RawReadaheadTriple("{", "RS", 47),
  ]

  static let ra46: [RawReadaheadTriple] = [
    RawReadaheadTriple("{", "RS", 48),
  ]

  static let ra47: [RawReadaheadTriple] = [
    RawReadaheadTriple("for", "RS", 3),
    RawReadaheadTriple("(", "RS", 5),
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("if", "RS", 7), 
    RawReadaheadTriple("}", "L", 51), 
    RawReadaheadTriple("-|", "L", 51),
  ]

  static let ra48: [RawReadaheadTriple] = [
    RawReadaheadTriple("for", "RS", 3), 
    RawReadaheadTriple("(", "RS", 5), 
    RawReadaheadTriple("walkInteger", "RSN", 67), 
    RawReadaheadTriple("walkIdentifier", "RSN", 6), 
    RawReadaheadTriple("if", "RS", 7), 
    RawReadaheadTriple("}", "L", 51), 
    RawReadaheadTriple("-|", "L", 51),
  ]

  static let ra49: [RawReadaheadTriple] = [
    RawReadaheadTriple("}", "RS", 82),
  ]

  static let ra50: [RawReadaheadTriple] = [
    RawReadaheadTriple("}", "RS", 52),
  ]

  static let readaheadTables: [RawReadaheadTable] = [
    RawReadaheadTable("ReadaheadTable", 0, 7, ra0), 
    RawReadaheadTable("ReadaheadTable", 1, 7, ra1), 
    RawReadaheadTable("ReadaheadTable", 2, 12, ra2), 
    RawReadaheadTable("ReadaheadTable", 3, 1, ra3), 
    RawReadaheadTable("ReadaheadTable", 4, 7, ra4), 
    RawReadaheadTable("ReadaheadTable", 5, 3, ra5), 
    RawReadaheadTable("ReadaheadTable", 6, 14, ra6), 
    RawReadaheadTable("ReadaheadTable", 7, 1, ra7), 
    RawReadaheadTable("ReadaheadTable", 8, 10, ra8), 
    RawReadaheadTable("ReadaheadTable", 9, 1, ra9), 
    RawReadaheadTable("ReadaheadTable", 10, 3, ra10), 
    RawReadaheadTable("ReadaheadTable", 11, 3, ra11), 
    RawReadaheadTable("ReadaheadTable", 12, 3, ra12), 
    RawReadaheadTable("ReadaheadTable", 13, 3, ra13), 
    RawReadaheadTable("ReadaheadTable", 14, 3, ra14), 
    RawReadaheadTable("ReadaheadTable", 15, 3, ra15), 
    RawReadaheadTable("ReadaheadTable", 16, 3, ra16), 
    RawReadaheadTable("ReadaheadTable", 17, 1, ra17), 
    RawReadaheadTable("ReadaheadTable", 18, 3, ra18), 
    RawReadaheadTable("ReadaheadTable", 19, 4, ra19), 
    RawReadaheadTable("ReadaheadTable", 20, 3, ra20), 
    RawReadaheadTable("ReadaheadTable", 21, 3, ra21), 
    RawReadaheadTable("ReadaheadTable", 22, 3, ra22), 
    RawReadaheadTable("ReadaheadTable", 23, 13, ra23), 
    RawReadaheadTable("ReadaheadTable", 24, 1, ra24), 
    RawReadaheadTable("ReadaheadTable", 25, 10, ra25), 
    RawReadaheadTable("ReadaheadTable", 26, 10, ra26), 
    RawReadaheadTable("ReadaheadTable", 27, 10, ra27), 
    RawReadaheadTable("ReadaheadTable", 28, 4, ra28), 
    RawReadaheadTable("ReadaheadTable", 29, 2, ra29), 
    RawReadaheadTable("ReadaheadTable", 30, 1, ra30), 
    RawReadaheadTable("ReadaheadTable", 31, 12, ra31), 
    RawReadaheadTable("ReadaheadTable", 32, 12, ra32), 
    RawReadaheadTable("ReadaheadTable", 33, 3, ra33), 
    RawReadaheadTable("ReadaheadTable", 34, 3, ra34), 
    RawReadaheadTable("ReadaheadTable", 35, 3, ra35), 
    RawReadaheadTable("ReadaheadTable", 36, 1, ra36), 
    RawReadaheadTable("ReadaheadTable", 37, 1, ra37), 
    RawReadaheadTable("ReadaheadTable", 38, 6, ra38), 
    RawReadaheadTable("ReadaheadTable", 39, 2, ra39), 
    RawReadaheadTable("ReadaheadTable", 40, 7, ra40), 
    RawReadaheadTable("ReadaheadTable", 41, 3, ra41), 
    RawReadaheadTable("ReadaheadTable", 42, 1, ra42), 
    RawReadaheadTable("ReadaheadTable", 43, 1, ra43), 
    RawReadaheadTable("ReadaheadTable", 44, 8, ra44), 
    RawReadaheadTable("ReadaheadTable", 45, 1, ra45), 
    RawReadaheadTable("ReadaheadTable", 46, 1, ra46), 
    RawReadaheadTable("ReadaheadTable", 47, 7, ra47), 
    RawReadaheadTable("ReadaheadTable", 48, 7, ra48), 
    RawReadaheadTable("ReadaheadTable", 49, 1, ra49), 
    RawReadaheadTable("ReadaheadTable", 50, 1, ra50)
  ]


  static let rb51: [RawReadbackTriple] = [
    RawReadbackTriple(("Statement", 1), "RSN", 53), 
    RawReadbackTriple(("|-", 0), "L", 95), 
    RawReadbackTriple(("{", 40), "L", 95), 
    RawReadbackTriple(("{", 47), "L", 95), 
    RawReadbackTriple(("{", 48), "L", 95),
  ]
  static let rb52: [RawReadbackTriple] = [
    RawReadbackTriple(("}", 52), "RS", 83), 
    RawReadbackTriple(("}", 44), "RS", 84),
  ]
  static let rb53: [RawReadbackTriple] = [
    RawReadbackTriple(("Statement", 1), "RSN", 53), 
    RawReadbackTriple(("|-", 0), "L", 95), 
    RawReadbackTriple(("{", 40), "L", 95), 
    RawReadbackTriple(("{", 47), "L", 95), 
    RawReadbackTriple(("{", 48), "L", 95),
  ]
  static let rb54: [RawReadbackTriple] = [
    RawReadbackTriple(("(", 19), "RS", 60), 
    RawReadbackTriple(("Expression", 39), "RSN", 85), 
    RawReadbackTriple(("Expression", 29), "RSN", 86),
  ]    
  static let rb55: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression2", 31), "RSN", 96), 
    RawReadbackTriple(("Expression2", 32), "RSN", 96), 
    RawReadbackTriple(("Expression2", 2), "RSN", 96),
  ]
  static let rb56: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression2", 31), "RSN", 97), 
    RawReadbackTriple(("Expression2", 32), "RSN", 97), 
    RawReadbackTriple(("Expression2", 2), "RSN", 97),
  ]
  static let rb57: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression0", 38), "RSN", 98), 
    RawReadbackTriple(("Expression0", 4), "RSN", 98), 
    RawReadbackTriple(("Expression0", 28), "RSN", 98),
  ]
  static let rb58: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression0", 38), "RSN", 99), 
    RawReadbackTriple(("Expression0", 4), "RSN", 99), 
    RawReadbackTriple(("Expression0", 28), "RSN", 99),
  ]
  static let rb59: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression0", 38), "RSN", 100), 
    RawReadbackTriple(("Expression0", 4), "RSN", 100), 
    RawReadbackTriple(("Expression0", 28), "RSN", 100),
  ]
  static let rb60: [RawReadbackTriple] = [
    RawReadbackTriple(("walkIdentifier", 23), "RSN", 102), 
    RawReadbackTriple(("walkIdentifier", 6), "RSN", 102),
  ]
  static let rb61: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression1", 26), "RSN", 103), 
    RawReadbackTriple(("Expression1", 27), "RSN", 103), 
    RawReadbackTriple(("Expression1", 8), "RSN", 103), 
    RawReadbackTriple(("Expression1", 25), "RSN", 103),
  ]
  static let rb62: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression1", 26), "RSN", 104), 
    RawReadbackTriple(("Expression1", 27), "RSN", 104),
    RawReadbackTriple(("Expression1", 8), "RSN", 104), 
    RawReadbackTriple(("Expression1", 25), "RSN", 104),
  ]
  static let rb63: [RawReadbackTriple] = [
    RawReadbackTriple(("Expression", 39), "RSN", 85), 
    RawReadbackTriple(("Expression", 29), "RSN", 86),
  ]

  static let readbackTables: [RawReadbackTable] = [
    RawReadbackTable("ReadbackTable", 51, 5, rb51), 
    RawReadbackTable("ReadbackTable", 52, 2, rb52), 
    RawReadbackTable("ReadbackTable", 53, 5, rb53), 
    RawReadbackTable("ReadbackTable", 54, 3, rb54), 
    RawReadbackTable("ReadbackTable", 55, 3, rb55), 
    RawReadbackTable("ReadbackTable", 56, 3, rb56), 
    RawReadbackTable("ReadbackTable", 57, 3, rb57), 
    RawReadbackTable("ReadbackTable", 58, 3, rb58), 
    RawReadbackTable("ReadbackTable", 59, 3, rb59), 
    RawReadbackTable("ReadbackTable", 60, 2, rb60), 
    RawReadbackTable("ReadbackTable", 61, 4, rb61), 
    RawReadbackTable("ReadbackTable", 62, 4, rb62), 
    RawReadbackTable("ReadbackTable", 63, 2, rb63)
  ]

  /******************************
    *                            *
    * SETTING UP SHIFTBACK TABLE *
    *                            *
    ******************************/          
  static let shiftbackTables: [RawShiftbackTable] = [  
    RawShiftbackTable("ShiftbackTable", 64, 1, 90),
    RawShiftbackTable("ShiftbackTable", 65, 1, 93),
    RawShiftbackTable("ShiftbackTable", 66, 1, 94),
    RawShiftbackTable("ShiftbackTable", 67, 1, 92),
    RawShiftbackTable("ShiftbackTable", 68, 1, 91),
    RawShiftbackTable("ShiftbackTable", 69, 1, 87),
    RawShiftbackTable("ShiftbackTable", 70, 2, 89),
    RawShiftbackTable("ShiftbackTable", 71, 3, 92),
    RawShiftbackTable("ShiftbackTable", 72, 2, 55),
    RawShiftbackTable("ShiftbackTable", 73, 2, 56),
    RawShiftbackTable("ShiftbackTable", 74, 2, 57),
    RawShiftbackTable("ShiftbackTable", 75, 2, 58),
    RawShiftbackTable("ShiftbackTable", 76, 2, 59),
    RawShiftbackTable("ShiftbackTable", 77, 3, 101),
    RawShiftbackTable("ShiftbackTable", 78, 1, 54),
    RawShiftbackTable("ShiftbackTable", 79, 2, 61),
    RawShiftbackTable("ShiftbackTable", 80, 2, 62),
    RawShiftbackTable("ShiftbackTable", 81, 5, 105),
    RawShiftbackTable("ShiftbackTable", 82, 11, 107),
    RawShiftbackTable("ShiftbackTable", 83, 10, 106),
    RawShiftbackTable("ShiftbackTable", 84, 6, 106),
    RawShiftbackTable("ShiftbackTable", 85, 1, 63),
    RawShiftbackTable("ShiftbackTable", 86, 1, 60),
  ]

  /*******************************
    *                            *
    * SETTING UP REDUCE TABLE    *
    *                            *
    ******************************/      
  static let rd87: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 4), 
    RawReduceTriple(1, "RSN", 4),
    RawReduceTriple(5, "RSN", 4), 
    RawReduceTriple(12, "RSN", 4), 
    RawReduceTriple(16, "RSN", 28), 
    RawReduceTriple(18, "RSN", 4), 
    RawReduceTriple(19, "RSN", 4), 
    RawReduceTriple(20, "RSN", 4), 
    RawReduceTriple(33, "RSN", 4), 
    RawReduceTriple(34, "RSN", 38), 
    RawReduceTriple(35, "RSN", 4), 
    RawReduceTriple(40, "RSN", 4), 
    RawReduceTriple(41, "RSN", 4), 
    RawReduceTriple(47, "RSN", 4), 
    RawReduceTriple(48, "RSN", 4),
  ]

  static let rd88: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 64), 
    RawReduceTriple(40, "RSN", 42), 
    RawReduceTriple(47, "RSN", 49), 
    RawReduceTriple(48, "RSN", 50),
  ]

  static let rd89: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 1), 
    RawReduceTriple(1, "RSN", 1), 
    RawReduceTriple(40, "RSN", 1), 
    RawReduceTriple(47, "RSN", 1), 
    RawReduceTriple(48, "RSN", 1),
  ]

  static let rd90: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 108),
  ] 

  static let rd91: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 2), 
    RawReduceTriple(1, "RSN", 2), 
    RawReduceTriple(5, "RSN", 2), 
    RawReduceTriple(12, "RSN", 2), 
    RawReduceTriple(13, "RSN", 2), 
    RawReduceTriple(14, "RSN", 2), 
    RawReduceTriple(15, "RSN", 2), 
    RawReduceTriple(16, "RSN", 2), 
    RawReduceTriple(18, "RSN", 2), 
    RawReduceTriple(19, "RSN", 2), 
    RawReduceTriple(20, "RSN", 2), 
    RawReduceTriple(21, "RSN", 31), 
    RawReduceTriple(22, "RSN", 32), 
    RawReduceTriple(33, "RSN", 2), 
    RawReduceTriple(34, "RSN", 2), 
    RawReduceTriple(35, "RSN", 2),
    RawReduceTriple(40, "RSN", 2), 
    RawReduceTriple(41, "RSN", 2), 
    RawReduceTriple(47, "RSN", 2), 
    RawReduceTriple(48, "RSN", 2),
  ]

  static let rd92: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 68), 
    RawReduceTriple(1, "RSN", 68), 
    RawReduceTriple(5, "RSN", 68), 
    RawReduceTriple(10, "RSN", 72), 
    RawReduceTriple(11, "RSN", 73), 
    RawReduceTriple(12, "RSN", 68), 
    RawReduceTriple(13, "RSN", 68), 
    RawReduceTriple(14, "RSN", 68), 
    RawReduceTriple(15, "RSN", 68), 
    RawReduceTriple(16, "RSN", 68), 
    RawReduceTriple(18, "RSN", 68), 
    RawReduceTriple(19, "RSN", 68), 
    RawReduceTriple(20, "RSN", 68), 
    RawReduceTriple(21, "RSN", 68), 
    RawReduceTriple(22, "RSN", 68), 
    RawReduceTriple(33, "RSN", 68), 
    RawReduceTriple(34, "RSN", 68), 
    RawReduceTriple(35, "RSN", 68), 
    RawReduceTriple(40, "RSN", 68), 
    RawReduceTriple(41, "RSN", 68), 
    RawReduceTriple(47, "RSN", 68), 
    RawReduceTriple(48, "RSN", 68),
  ]

  static let rd93: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 8), 
    RawReduceTriple(1, "RSN", 8), 
    RawReduceTriple(5, "RSN", 8), 
    RawReduceTriple(12, "RSN", 8), 
    RawReduceTriple(13, "RSN", 25), 
    RawReduceTriple(14, "RSN", 26), 
    RawReduceTriple(15, "RSN", 27), 
    RawReduceTriple(16, "RSN", 8), 
    RawReduceTriple(18, "RSN", 8), 
    RawReduceTriple(19, "RSN", 8), 
    RawReduceTriple(20, "RSN", 8), 
    RawReduceTriple(33, "RSN", 8), 
    RawReduceTriple(34, "RSN", 8), 
    RawReduceTriple(35, "RSN", 8), 
    RawReduceTriple(40, "RSN", 8), 
    RawReduceTriple(41, "RSN", 8), 
    RawReduceTriple(47, "RSN", 8), 
    RawReduceTriple(48, "RSN", 8),
  ]

  static let rd94: [RawReduceTriple] = [  
    RawReduceTriple(0, "RSN", 9), 
    RawReduceTriple(1, "RSN", 9), 
    RawReduceTriple(5, "RSN", 17), 
    RawReduceTriple(12, "RSN", 24), 
    RawReduceTriple(18, "RSN", 77), 
    RawReduceTriple(19, "RSN", 29), 
    RawReduceTriple(20, "RSN", 30), 
    RawReduceTriple(33, "RSN", 37), 
    RawReduceTriple(35, "RSN", 39), 
    RawReduceTriple(40, "RSN", 9), 
    RawReduceTriple(41, "RSN", 43), 
    RawReduceTriple(47, "RSN", 9), 
    RawReduceTriple(48, "RSN", 9),
  ]

  static let reduceTables: [RawReduceTable] = [
    RawReduceTable("ReduceTable", 87, "Expression0", 15, rd87), 
    RawReduceTable("ReduceTable", 88, "Statements", 4, rd88), 
    RawReduceTable("ReduceTable", 89, "Statement", 5, rd89), 
    RawReduceTable("ReduceTable", 90, "Grammar", 1, rd90), 
    RawReduceTable("ReduceTable", 91, "Expression2", 20, rd91), 
    RawReduceTable("ReduceTable", 92, "Expression3", 22, rd92), 
    RawReduceTable("ReduceTable", 93, "Expression1", 18, rd93), 
    RawReduceTable("ReduceTable", 94, "Expression", 13, rd94)
  ]

  /*******************************
    *                            *
    * SETTING UP SEMANTIC TABLE  *
    *                            *
    ******************************/
  static let semanticTables: [RawSemanticTable] = [
    RawSemanticTable("SemanticTable", 95, "buildTree", 1, ["walkList"], 88),
    RawSemanticTable("SemanticTable", 96, "buildTree", 1, ["walkMultiply"], 91),
    RawSemanticTable("SemanticTable", 97, "buildTree", 1, ["walkDivide"], 91),
    RawSemanticTable("SemanticTable", 98, "buildTree", 1, ["walkLess"], 87),
    RawSemanticTable("SemanticTable", 99, "buildTree", 1, ["walkGreater"], 87),
    RawSemanticTable("SemanticTable", 100, "buildTree", 1, ["walkEqual"], 87),
    RawSemanticTable("SemanticTable", 101, "buildTree", 1, ["walkAssign"], 94),
    RawSemanticTable("SemanticTable", 102, "buildTree", 1, ["walkSend"], 92),
    RawSemanticTable("SemanticTable", 103, "buildTree", 1, ["walkPlus"], 93),
    RawSemanticTable("SemanticTable", 104, "buildTree", 1, ["walkMinus"], 93),
    RawSemanticTable("SemanticTable", 105, "buildTree", 1, ["walkIf"], 94),
    RawSemanticTable("SemanticTable", 106, "buildTree", 1, ["walkIf"], 89),
    RawSemanticTable("SemanticTable", 107, "buildTree", 1, ["walkFor"], 89),
  ]

  static let acceptTable: RawAcceptTable = RawAcceptTable("AcceptTable", 108)

  let rawParserTables: RawParserTables = RawParserTables(
    1, keywords,
    51, readaheadTables,
    13, readbackTables,
    23, shiftbackTables,
    8, reduceTables,
    13, semanticTables,
    acceptTable      
  )

  /******************************
    *                            *
    * SETTING UP SCANNER TABLES  *
    *                            *
    ******************************/
  static let t0: [RawScannerReadaheadTriple] = [
    RawScannerReadaheadTriple(Array("#"), "R", 5), 
    RawScannerReadaheadTriple(Array("{"), "RK", 22), 
    RawScannerReadaheadTriple(Array("}"), "RK", 23), 
    RawScannerReadaheadTriple(Array("\0"), "L", 6), 
    RawScannerReadaheadTriple(Array("<"), "RK", 17), 
    RawScannerReadaheadTriple(Array("="), "RK", 2), 
    RawScannerReadaheadTriple(Array(">"), "RK", 19), 
    RawScannerReadaheadTriple(Array(")"), "RK", 8), 
    RawScannerReadaheadTriple(Array("*"), "RK", 9), 
    RawScannerReadaheadTriple(Array("+"), "RK", 10), 
    RawScannerReadaheadTriple(Array(","), "RK", 11), 
    RawScannerReadaheadTriple(Array("-"), "RK", 12), 
    RawScannerReadaheadTriple(Array("("), "RK", 7), 
    RawScannerReadaheadTriple(Array("/"), "RK", 13), 
    RawScannerReadaheadTriple(Array("0123456789"), "RK", 1), 
    RawScannerReadaheadTriple(Array(":"), "RK", 15), 
    RawScannerReadaheadTriple(Array(";"), "RK", 16), 
    RawScannerReadaheadTriple(Array("?"), "RK", 20), 
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz"), "RK", 3), 
    RawScannerReadaheadTriple([11, 12, 14, 15], "R", 4), 
    RawScannerReadaheadTriple(Array(" "), "R", 4)
  ]

  static let t1: [RawScannerReadaheadTriple] = [  
    RawScannerReadaheadTriple([11, 12, 14, 15], "L", 14), 
    RawScannerReadaheadTriple(Array("\0"), "L", 14), 
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_+-*/<>=?[]{}()^;#:.$ "), "L", 14), 
    RawScannerReadaheadTriple(Array("0123456789"), "RK", 1)
  ]

  static let t2: [RawScannerReadaheadTriple] = [  
    RawScannerReadaheadTriple([11, 12, 14, 15], "L", 18), 
    RawScannerReadaheadTriple(Array("\0"), "L", 18), 
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/<>?[]{}()^;#:.$ "), "L", 18), 
    RawScannerReadaheadTriple(Array("="), "RK", 24)
  ]

  static let t3: [RawScannerReadaheadTriple] = [  
    RawScannerReadaheadTriple([11, 12, 14, 15], "L", 21), 
    RawScannerReadaheadTriple(Array("\0"), "L", 21), 
    RawScannerReadaheadTriple(Array("+-*/<>=?[]{}()^;#:.$ "), "L", 21), 
    RawScannerReadaheadTriple(Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz"), "RK", 3)
  ]

  static let t4: [RawScannerReadaheadTriple] = [  
    RawScannerReadaheadTriple(Array("\0"), "L", 0), 
    RawScannerReadaheadTriple(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/<>=?[]{}()^;#:.$"), "L", 0), 
    RawScannerReadaheadTriple([11, 12, 14, 15], "R", 4), 
    RawScannerReadaheadTriple(Array(" "), "R", 4)
  ]

  static let t5: [RawScannerReadaheadTriple] = [  
    RawScannerReadaheadTriple([11], "R", 5), 
    RawScannerReadaheadTriple(Array("\0"), "R", 5), 
    RawScannerReadaheadTriple(Array("=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_abcdefghijklmnopqrstuvwxyz{} #$()*+-./0123456789:;<"), "R", 5), 
    RawScannerReadaheadTriple([12, 14, 15], "R", 0)    
  ]
  
  static let scannerReadaheadTables: [RawScannerReadaheadTable] = [
    RawScannerReadaheadTable("ScannerReadaheadTable", 0, 21, t0), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 1, 4, t1), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 2, 4, t2), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 3, 4, t3), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 4, 4, t4), 
    RawScannerReadaheadTable("ScannerReadaheadTable", 5, 4, t5)
  ]

   //Define VARIABLES to refer to semantic table PARAMETERs.
   //FORMAT {string0, string1, ...} 
  static let p6: [String] = ["-|"]
  static let p7: [String] = ["("]
  static let p8: [String] = [")"]
  static let p9: [String] = ["*"]
  static let p10: [String] = ["+"]
  static let p11: [String] = [","]
  static let p12: [String] = ["-"]
  static let p13: [String] = ["/"]
  static let p14: [String] = ["walkInteger"]
  static let p15: [String] = [":"]
  static let p16: [String] = [";"]
  static let p17: [String] = ["<"]
  static let p18: [String] = ["="]
  static let p19: [String] = [">"]
  static let p20: [String] = ["?"]
  static let p21: [String] = ["walkIdentifier"]
  static let p22: [String] = ["{"]
  static let p23: [String] = ["}"]
  static let p24: [String] = ["=="]

  static let scannerSemanticTables: [RawSemanticTable] = [
    RawSemanticTable("SemanticTable", 6, "buildToken", 1, p6, 0), 
    RawSemanticTable("SemanticTable", 7, "buildToken", 1, p7, 0), 
    RawSemanticTable("SemanticTable", 8, "buildToken", 1, p8, 0), 
    RawSemanticTable("SemanticTable", 9, "buildToken", 1, p9, 0), 
    RawSemanticTable("SemanticTable", 10, "buildToken", 1, p10, 0), 
    RawSemanticTable("SemanticTable", 11, "buildToken", 1, p11, 0), 
    RawSemanticTable("SemanticTable", 12, "buildToken", 1, p12, 0), 
    RawSemanticTable("SemanticTable", 13, "buildToken", 1, p13, 0), 
    RawSemanticTable("SemanticTable", 14, "buildToken", 1, p14, 0), 
    RawSemanticTable("SemanticTable", 15, "buildToken", 1, p15, 0), 
    RawSemanticTable("SemanticTable", 16, "buildToken", 1, p16, 0), 
    RawSemanticTable("SemanticTable", 17, "buildToken", 1, p17, 0), 
    RawSemanticTable("SemanticTable", 18, "buildToken", 1, p18, 0), 
    RawSemanticTable("SemanticTable", 19, "buildToken", 1, p19, 0), 
    RawSemanticTable("SemanticTable", 20, "buildToken", 1, p20, 0), 
    RawSemanticTable("SemanticTable", 21, "buildToken", 1, p21, 0), 
    RawSemanticTable("SemanticTable", 22, "buildToken", 1, p22, 0), 
    RawSemanticTable("SemanticTable", 23, "buildToken", 1, p23, 0), 
    RawSemanticTable("SemanticTable", 24, "buildToken", 1, p24, 0)
  ]

  static let rawScannerTables: RawScannerTables = RawScannerTables(
    6, scannerReadaheadTables,
    19, scannerSemanticTables
  )
}

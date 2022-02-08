enum TableType: String {
    case
    // Scanner tables
    ScannerReadaheadTable,

    // parser tables
    Keywords, ReadaheadTable, ReadbackTable, ShiftbackTable,
    ReduceTable, AcceptTable,

    // Both
    SemanticTable
}
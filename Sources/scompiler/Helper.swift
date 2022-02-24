extension StringProtocol {
  var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}

// Making Pair a key to dictionary
protocol PairConvertible {
  associatedtype T
  associatedtype U
  init(_ pair: (T, U))
}
struct PairHashable<T, U>: Hashable, PairConvertible where T: Hashable, U: Hashable {
  let first: T
  let second: U  
  init(_ pair: (T, U)) {
    self.first = pair.0
    self.second = pair.1
  }
}
extension Dictionary where Key: PairConvertible {
  subscript (key: (Key.T, Key.U)) -> Value? {
    get {
      return self[Key(key)]
    }
    set {
      self[Key(key)] = newValue
    }
  }
  subscript (key0: Key.T, key1: Key.U) -> Value? {
    get {
      return self[Key((key0, key1))]
    }
    set {
      self[Key((key0, key1))] = newValue
    }
  }
}
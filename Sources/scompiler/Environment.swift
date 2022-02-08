import Foundation

extension OutputStream {
  func write(_ data: Data) -> Int {
    data.withUnsafeBytes { rawBuffer in
      var buffer = rawBuffer.bindMemory(to: UInt8.self)
      let byteCount = buffer.count // Gotta save this before mutating `buffer`
      while !buffer.isEmpty {
        let written = self.write(buffer.baseAddress!, maxLength: buffer.count)
        guard written >= 0 else {
          return -1
        }
        buffer = .init(rebasing: buffer.dropFirst(written))
      }

      return rawBuffer.count
    }
  }
}
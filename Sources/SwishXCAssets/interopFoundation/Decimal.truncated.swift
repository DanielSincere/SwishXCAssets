import Foundation

extension Decimal {
  var truncated: CGFloat {
    Double(truncating: self as NSNumber)
  }
}

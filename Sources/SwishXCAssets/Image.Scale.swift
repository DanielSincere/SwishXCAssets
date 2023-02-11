import Foundation

extension Image {
  enum Scale {
    case one
    case two
    case three
    
    var fileLabel: String {
      switch self {
      case .one: return ""
      case .two: return "@2x"
      case .three: return "@3x"
      }
    }
    
    var jsonLabel: String {
      switch self {
      case .one: return "1x"
      case .two: return "2x"
      case .three: return "3x"
      }
    }
    
    var decimal: Decimal {
      switch self {
      case .one: return 1
      case .two: return 2
      case .three: return 3
      }
    }
  }

}

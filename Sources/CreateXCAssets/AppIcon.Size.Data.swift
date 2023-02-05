import Foundation

extension AppIcon.Size {
  struct Data {
    let baseWidth: Decimal
    let scale: AppIcon.Scale
    
    var pixelWidth: Decimal {
      switch scale {
      case .one: return baseWidth * self.scale.decimal
      case .two: return baseWidth * self.scale.decimal
      case .three: return baseWidth * self.scale.decimal
      }
    }
    
    init(_ baseWidth: Decimal, _ scale: AppIcon.Scale) {
      self.baseWidth = baseWidth; self.scale = scale
    }
  }
}

import Foundation

extension Image {
  struct Data {
    let baseWidth: Decimal
    let scale: Image.Scale
    let idiom: Image.Idiom
    
    var pixelWidth: Decimal {
      switch scale {
      case .one: return baseWidth * self.scale.decimal
      case .two: return baseWidth * self.scale.decimal
      case .three: return baseWidth * self.scale.decimal
      }
    }
    
    init(_ baseWidth: Decimal, _ scale: Image.Scale, _ idiom: Image.Idiom) {
      self.baseWidth = baseWidth; self.scale = scale; self.idiom = idiom
    }
  }
}

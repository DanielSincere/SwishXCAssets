import Foundation

extension Image {
  enum Idiom: String, Codable {
    case mac, iphone, ipad, iosMarketing = "ios-marketing"
    
    var images: Set<Image> {
      Image.allCases.lazy
        .filter { $0.data.idiom == self }
        .reduce(Set<Image>()) {
          $0.union(Set(arrayLiteral: $1))
        }
    }
  }
}

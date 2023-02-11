import Foundation

public enum Platform {
  case mac, iPhone, iPad
  
  var idioms: Set<Image.Idiom> {
    switch self {
    case .mac:
      return [.mac]
    case .iPhone:
      return [.iphone, .iosMarketing]
    case .iPad:
      return [.ipad, .iosMarketing]
    }
  }
}

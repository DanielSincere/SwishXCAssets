import Foundation

public enum Image: CaseIterable, Encodable {
  case iPhoneNotification2x, iPhoneNotification3x
  case iPhoneSettings2x, iPhoneSettings3x
  case iPhoneSpotlight2x, iPhoneSpotlight3x
  case iPhoneApp2x, iPhoneApp3x
  case iPadNotifications, iPadNotifications2x
  case iPadSettings, iPadSettings2x
  case iPadSpotlight, iPadSpotlight2x
  case iPadApp, iPadApp2x
  case iPadPro2x
  case AppStore
  
  case mac16, mac16_2x
  case mac32, mac32_2x
  case mac128, mac128_2x
  case mac256, mac256_2x
  case mac512, mac512_2x
  
  var data: Data {
    switch self {
    case .iPhoneNotification2x: return .init(20, .two, .iphone)
    case .iPhoneNotification3x: return .init(20, .three, .iphone)
    case .iPhoneSettings2x: return .init(29, .two, .iphone)
    case .iPhoneSettings3x: return .init(29, .three, .iphone)
    case .iPhoneSpotlight2x: return .init(40, .two, .iphone)
    case .iPhoneSpotlight3x: return .init(40, .three, .iphone)
    case .iPhoneApp2x: return .init(60, .two, .iphone)
    case .iPhoneApp3x: return .init(60, .three, .iphone)
    case .iPadNotifications: return .init(20, .one, .ipad)
    case .iPadNotifications2x: return .init(20, .two, .ipad)
    case .iPadSettings: return .init(29, .one, .ipad)
    case .iPadSettings2x: return .init(29, .two, .ipad)
    case .iPadSpotlight: return .init(40, .one, .ipad)
    case .iPadSpotlight2x: return .init(40, .two, .ipad)
    case .iPadApp: return .init(76, .one, .ipad)
    case .iPadApp2x: return .init(76, .two, .ipad)
    case .iPadPro2x: return .init(83.5, .two, .ipad)
    case .AppStore: return .init(1024, .one, .iosMarketing)
      
    case .mac16: return .init(16, .one, .mac)
    case .mac16_2x: return .init(16, .two, .mac)
    case .mac32: return .init(32, .one, .mac)
    case .mac32_2x: return .init(32, .two, .mac)
    case .mac128: return .init(128, .one, .mac)
    case .mac128_2x: return .init(128, .two, .mac)
    case .mac256: return .init(256, .one, .mac)
    case .mac256_2x: return .init(256, .two, .mac)
    case .mac512: return .init(512, .one, .mac)
    case .mac512_2x: return .init(512, .two, .mac)
    }
  }
  
  var filename: String {
    switch self.data.scale {
    case .one:
      return "AppIcon-\(self.data.idiom.rawValue)-\(self.data.pixelWidth).png"
    case .two, .three:
      return "AppIcon-\(self.data.idiom.rawValue)-\(self.data.pixelWidth)-\(self.data.baseWidth)\(self.data.scale.fileLabel).png"
    }
  }
  
  enum CodingKeys: String, CodingKey {
    case scale
    case idiom
    case size
    case filename
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(filename, forKey: .filename)
    try container.encode(data.idiom, forKey: .idiom)
    try container.encode(data.scale.jsonLabel, forKey: .scale)
    try container.encode("\(data.baseWidth)x\(data.baseWidth)", forKey: .size)
  }
}

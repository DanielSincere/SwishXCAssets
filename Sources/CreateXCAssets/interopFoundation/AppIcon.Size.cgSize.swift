import Foundation

extension AppIcon.Size {
  var cgSize: CGSize {
    let cgfloat: CGFloat = self.data.baseWidth.truncated
    return CGSize(width: cgfloat, height: cgfloat)    
  }
}

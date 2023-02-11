import Foundation

extension Image {
  var cgSize: CGSize {
    let cgfloat: CGFloat = self.data.baseWidth.truncated
    return CGSize(width: cgfloat, height: cgfloat)    
  }
}

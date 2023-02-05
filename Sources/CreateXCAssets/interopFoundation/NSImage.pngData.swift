import AppKit

extension NSImage {
  var pngData: Data? {
    guard
      let tiffRepresentation = tiffRepresentation,
      let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else {
      return nil
    }
    return bitmapImage.representation(using: .png, properties: [:])
  }
}

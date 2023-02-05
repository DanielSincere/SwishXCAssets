import Foundation
import Fork
import SwiftDraw

public struct AppIcon {

  let inputSVG: String, outputDir: String
  public init(inputSVG: String, outputDir: String) {
    self.inputSVG = inputSVG
    self.outputDir = outputDir
  }

  public func render() async throws {
    try FileManager.default.createDirectory(atPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset", withIntermediateDirectories: true)


    guard let svg = SVG(fileURL: URL(fileURLWithPath: inputSVG)) else {
      throw Errors.couldNotLoadAppIcon(path: inputSVG)
    }

    try await AppIcon.Size.allCases.asyncForEach { size in
      let pngPath = "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/\(size.filename)"
      let image = svg.rasterize(with: size.cgSize, scale: size.data.scale.decimal.truncated)
      guard let pngData = image.pngData else {
        throw Errors.couldNotRenderAppIcon(size: size)
      }
      try pngData.write(to: URL(fileURLWithPath: pngPath))
    }

    try XCAssetsJSON.xcassetsContents.data(using: .utf8)!.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/Contents.json"))
    try XCAssetsJSON.appiconsetContents.data(using: .utf8)!.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/Contents.json"))
  }
  
  public enum Errors: Error, LocalizedError {
    case couldNotLoadAppIcon(path: String)
    case couldNotRenderAppIcon(size: AppIcon.Size)
    
    public var errorDescription: String? {
      switch self {
      case let .couldNotLoadAppIcon(path: path):
        return "could not load app icon from path \(path)"
      case let .couldNotRenderAppIcon(size: size):
        return "could not render app icon at size: \(size)"
      }
    }
  }
}

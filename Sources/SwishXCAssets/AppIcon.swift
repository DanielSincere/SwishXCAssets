import Foundation
import Fork
import SwiftDraw


public struct AppIcon {

  let inputSVG: String, outputDir: String
  public init(inputSVG: String, outputDir: String) {
    self.inputSVG = inputSVG
    self.outputDir = outputDir
  }

  public func render(platforms: Set<Platform>) async throws {
    try FileManager.default.createDirectory(atPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset", withIntermediateDirectories: true)


    guard let svg = SVG(fileURL: URL(fileURLWithPath: inputSVG)) else {
      throw Errors.couldNotLoadAppIcon(path: inputSVG)
    }

    let images = platforms
      .map { $0.idioms }
      .reduce(Set<Image.Idiom>()) { $0.union($1) }
      .flatMap { $0.images }
    
    try await images.asyncForEach { size in
      let pngPath = "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/\(size.filename)"
      let image = svg.rasterize(with: size.cgSize, scale: size.data.scale.decimal.truncated)
      guard let pngData = image.pngData else {
        throw Errors.couldNotRenderAppIcon(size: size)
      }
      try pngData.write(to: URL(fileURLWithPath: pngPath))
    }

    
    try XCAssetsContents.string.data(using: .utf8)!.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/Contents.json"))
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let appiconsetContents = try encoder.encode(AppiconsetContents(images: images))
    try appiconsetContents.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/Contents.json"))
  }
  
  public enum Errors: Error, LocalizedError {
    case couldNotLoadAppIcon(path: String)
    case couldNotRenderAppIcon(size: Image)
    
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

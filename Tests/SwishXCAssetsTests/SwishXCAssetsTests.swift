import XCTest
import SwishXCAssets

final class SwishXCAssetsTests: XCTestCase {

  func testRender() async throws {
    try await AppIcon(inputSVG: "Sample.svg", outputDir: "SampleApp")
      .render(platforms: [.iPhone, .iPad, .mac])
  }
}

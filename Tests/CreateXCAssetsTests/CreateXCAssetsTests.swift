import XCTest
import CreateXCAssets

final class CreateXCAssetsTests: XCTestCase {

  func testRender() async throws {
    try await AppIcon(inputSVG: "Sample.svg", outputDir: "SampleApp").render()
  }
}

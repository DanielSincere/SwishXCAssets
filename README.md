# SwishXCAssets

Render an App Icon for your iOS app from an SVG, in the accompanying XCAssets file structure.

## Usage

Import this into your [Swish](https://github.com/FullQueueDeveloper/Swish.git) scripts so you can `swish appicon` whenever you need to regenerate.

In your Swish's `Package.swift`

```swift
  dependencies: [
  .package(url: "https://github.com/FullQueueDeveloper/SwishXCAssets.git", from: "0.1.0"),
  // ...
  ],
  targets: [
    .executableTarget(name: "appicon", dependencies: ["SwishXCAssets"]),
    // ...
  ],
```

And the code for the `appicon` target might look like

```swift
import SwishXCAssets

@main
struct AppIconMain {
  static func main() async throws {
    let svgPath = "path/to/AppIcon.svg"
    try await AppIcon(inputSVG: svgPath, outputDir: "MyApp")
      .render(platforms: [.iPhone, .iPad, .mac])
  }
}
```

## Full example

The [ios-base](https://github.com/0xOpenBytes/ios-base) template app uses this library to generate an App Icon. An App Icon is needed to upload to TestFlight.
https://github.com/0xOpenBytes/ios-base/blob/9fe9836bb5e771d70ceb34114ec1e95745f2263d/Swish/Package.swift#L23

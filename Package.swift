// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "PlayKitUtils",
    platforms: [.iOS(.v11),
                .tvOS(.v11)],
    products: [.library(name: "PlayKitUtils",
                        targets: ["PlayKitUtils"])],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "5.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
    ],
    targets: [.target(name: "PlayKitUtils",
                      dependencies: [],
                      path: "Sources"),
              .testTarget(name: "PlayKitUtilsTests",
                          dependencies: ["PlayKitUtils", "Quick", "Nimble"],
                          path: "Example/Tests/")]
)

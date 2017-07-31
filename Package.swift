// swift-tools-version:4.0

import PackageDescription

let package = Package(name: "StopWatch")

package.dependencies = [
    .package(url: "https://github.com/rxwei/CommandLine.git", from: "3.0.0"),
    .package(url: "https://github.com/antitypical/Result.git", from: "3.0.0"),
]

package.products = [
   .executable(name: "swatch", targets: ["main"]),
   .library(name: "StopWatch", targets: ["lib"]),
]

package.targets = [
    // executable
    .target(name: "main", dependencies: ["cli", "Result"]),

    // cli interface for testing
    // This target exists because main/executable targets are not testable
    .target(name: "cli", dependencies: ["lib", "CommandLine", "Result"]),
    .testTarget(name: "cliTests", dependencies: ["cli"]),

    // library
    .target(name: "lib", dependencies: []),
    .testTarget(name: "libTests", dependencies: ["lib"]),
]

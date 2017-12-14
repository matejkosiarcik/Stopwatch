// swift-tools-version:4.0
//
// This file is part of Stopwatch which is released under MIT license.
// See file LICENSE.txt or go to https://github.com/matejkosiarcik/Stopwatch for full license details.
//

import PackageDescription

let package = Package(name: "Stopwatch")

package.dependencies = [
    .package(url: "https://github.com/rxwei/CommandLine.git", from: "3.0.0"),
    .package(url: "https://github.com/antitypical/Result.git", from: "3.0.0"),
]

package.products = [
   .executable(name: "swatch", targets: ["main"]),
]

package.targets = [
    // executable
    .target(name: "main", dependencies: ["lib", "Result"]),

    // library
    .target(name: "lib", dependencies: ["CommandLine", "Result"]),
    .testTarget(name: "libTests", dependencies: ["lib"]),
]

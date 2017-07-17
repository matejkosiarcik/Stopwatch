//
// main.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import cli
import Foundation

let result = Program.new(for: CommandLine.arguments).map { $0.main() }
switch result {
case .success(let exitCode): exit(exitCode)
case .failure(let error): print(error.description); exit(1)
}

//
// main.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import cli
import Foundation

var helperOutput = ""
let result = Program.new(for: CommandLine.arguments).map { $0.main(output: &helperOutput) }
helperOutput = helperOutput.trimmingCharacters(in: .whitespacesAndNewlines)
switch result {
case .success(let exitCode):
    if helperOutput != "" { print(helperOutput) }
    exit(exitCode)
case .failure(let error):
    print(error.description)
    exit(1)
}

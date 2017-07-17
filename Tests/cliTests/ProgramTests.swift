//
// ProgramTests.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

@testable import cli
import XCTest

final class ProgramTests: XCTestCase {}

extension ProgramTests {
    func testCreation() {
        // given
        let arguments = [
            ["", "-h"],
            ["", "-h", "--version"],
        ]
        let expected = [(true, false), (true, true)].map { Arguments(path: "", help: $0.0, version: $0.1, usage: "") }

        // when
        let tested = arguments.map { Program.new(for: $0).map { $0.arguments } }

        // then
        XCTAssertEqual(tested.count, expected.count)
        zip(tested, expected).enumerated().forEach {
            switch $0.element.0 {
            case .success(let x): XCTAssertEqual(x, $0.element.1)
            case .failure(let x): XCTFail(String(describing: x) + " " + $0.offset.description)
            }
        }
    }
}

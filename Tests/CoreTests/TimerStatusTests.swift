//
// TimerStatusTests.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

@testable import Core
import XCTest

final class TimerStatusTests: XCTestCase {}

// MARK: - Equality
extension TimerStatusTests {
    func testEquality() {
        // given
        let date = Date()
        let reference: [Core.Timer.Status] = [.stopped, .running(date)]
        let testers: [Core.Timer.Status] = [.stopped, .running(date), .running(Date())]
        let expected = [[true, false, false], [false, true, false]].flatMap { $0 }

        // when
        let tested = reference.flatMap { ref in testers.flatMap { ref == $0 } }

        // then
        XCTAssertEqual(tested, expected)
    }
}

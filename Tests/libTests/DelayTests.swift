//
// DelayTests.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import XCTest

final class DelayTests: XCTestCase {}

extension DelayTests {
    func testDelay() {
        // given
        let start = Date()

        // when
        delay(0.5)
        let interval = abs(start.timeIntervalSinceNow)

        // then
        XCTAssertEqual(interval, 0.5, accuracy: 0.05)
    }
}

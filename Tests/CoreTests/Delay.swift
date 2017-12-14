//
// Delay.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import XCTest

extension XCTestCase {
    func delay(_ duration: TimeInterval) {
        let exp = expectation(description: "Generic delay")
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { exp.fulfill() }
        wait(for: [exp], timeout: duration + 0.05)
    }
}

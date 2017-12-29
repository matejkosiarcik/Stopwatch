//
// This file is part of Stopwatch which is released under MIT license.
// See file LICENSE.txt or go to https://github.com/matejkosiarcik/Stopwatch for full license details.
//

@testable import Core
import XCTest

final class TimerTests: XCTestCase {
    private let accuracy = 0.1
}

// MARK: - Creation
extension TimerTests {
    func testInitialization() {
        // when
        let timer = Timer()

        // then
        XCTAssertEqual(timer.current, 0)
        XCTAssertEqual(timer.status, .stopped)
    }
}

// MARK: - Running
extension TimerTests {
    func testStarting() {
        // given
        var timer = Timer()

        // when
        timer.start()
        delay(0.2)

        // then
        XCTAssertEqual(timer.current, 0.2, accuracy: self.accuracy)
        switch timer.status {
        case .running: break
        default: XCTFail("Timer should be running")
        }
    }

    func testMultipleStarts() {
        // given
        var timer = Timer()

        // when
        timer.start()
        delay(0.2)
        timer.start()

        // then
        XCTAssertEqual(timer.current, 0.2, accuracy: self.accuracy)
        switch timer.status {
        case .running: break
        default: XCTFail("Timer should be running")
        }
    }

    func testStopping() {
        // given
        var timer = Timer()

        // when
        timer.start()
        delay(0.2)
        timer.stop()

        // then
        XCTAssertEqual(timer.current, 0.2, accuracy: self.accuracy)
        XCTAssertTrue(timer.status == .stopped)
    }

    func testMultipleStops() {
        // given
        var timer = Timer()

        // when
        timer.start()
        delay(0.2)
        timer.stop()
        timer.stop()

        // then
        XCTAssertEqual(timer.current, 0.2, accuracy: self.accuracy)
        XCTAssertTrue(timer.status == .stopped)
    }

    func testToggling() {
        // given
        var timer = Timer()

        // when
        timer.toggle()
        delay(0.1)

        // then
        XCTAssertEqual(timer.current, 0.1, accuracy: self.accuracy)
        switch timer.status {
        case .running: break
        default: XCTFail("Timer should be running")
        }

        // when
        timer.toggle()

        // then
        XCTAssertEqual(timer.current, 0.1, accuracy: self.accuracy)
        XCTAssertTrue(timer.status == .stopped)
    }
}

// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
// Sourcery.LinuxMain.swift.stencil - original
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

@testable import cliTests
@testable import libTests

extension ArgumentsTest {
    static var allTests = [
        ("testInitialization", testInitialization),
        ("testUnsuccessfulParsing", testUnsuccessfulParsing),
        ("testSuccessfulParsing", testSuccessfulParsing),
        ("testExecutablePathFileName", testExecutablePathFileName),
        ("testErrorDescription", testErrorDescription),
    ]
}

extension CommandLineKitTest {
    static var allTests = [
        ("testUsage", testUsage),
    ]
}

extension HelpersTest {
    static var allTests = [
        ("testCharacterReading", testCharacterReading),
        ("testShellExitCode", testShellExitCode),
    ]
}

extension ProgramTests {
    static var allTests = [
        ("testCreation", testCreation),
        ("testHelpOutput", testHelpOutput),
        ("testVersionOutput", testVersionOutput),
    ]
}

extension TimeIntervalTest {
    static var allTests = [
        ("testFormatting", testFormatting),
    ]
}

extension TimerStatusTest {
    static var allTests = [
        ("testEquatability", testEquatability),
    ]
}

extension TimerTest {
    static var allTests = [
        ("testInitialization", testInitialization),
        ("testStarting", testStarting),
    ]
}

XCTMain([
    testCase(ArgumentsTest.allTests),
    testCase(CommandLineKitTest.allTests),
    testCase(HelpersTest.allTests),
    testCase(ProgramTests.allTests),
    testCase(TimeIntervalTest.allTests),
    testCase(TimerStatusTest.allTests),
    testCase(TimerTest.allTests),
])

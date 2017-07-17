// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
// Sourcery.cases.swift.stencil - original
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
// 

@testable import cliTests\n@testable import libTests
extension ArgumentsTest {
    static var allTests: [(String, (ArgumentsTest) -> () throws -> Void)] = [
        ("testInitialization", testInitialization),
        ("testUnsuccessfulParsing", testUnsuccessfulParsing),
        ("testSuccessfulParsing", testSuccessfulParsing),
        ("testExecutablePathFileName", testExecutablePathFileName),
        ("testErrorDescription", testErrorDescription),
    ]
}
extension CommandLineKitTest {
    static var allTests: [(String, (CommandLineKitTest) -> () throws -> Void)] = [
        ("testUsage", testUsage),
    ]
}
extension HelpersTest {
    static var allTests: [(String, (HelpersTest) -> () throws -> Void)] = [
        ("testCharacterReading", testCharacterReading),
        ("testShellExitCode", testShellExitCode),
    ]
}
extension ProgramTests {
    static var allTests: [(String, (ProgramTests) -> () throws -> Void)] = [
        ("testCreation", testCreation),
        ("testHelpOutput", testHelpOutput),
        ("testVersionOutput", testVersionOutput),
    ]
}
extension TimeIntervalTest {
    static var allTests: [(String, (TimeIntervalTest) -> () throws -> Void)] = [
        ("testFormatting", testFormatting),
    ]
}
extension TimerStatusTest {
    static var allTests: [(String, (TimerStatusTest) -> () throws -> Void)] = [
        ("testEquatability", testEquatability),
    ]
}
extension TimerTest {
    static var allTests: [(String, (TimerTest) -> () throws -> Void)] = [
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

//
// This file is part of Stopwatch which is released under MIT license.
// See file LICENSE.txt or go to https://github.com/matejkosiarcik/Stopwatch for full license details.
//

import Foundation
import Result

public struct Program {
    let arguments: Arguments
}

extension Program {
    public typealias Error = Arguments.Error
    public typealias ExitCode = Int32
}

extension Program {
    public static func new(for arguments: [String]) -> Result<Program, Program.Error> {
        return Arguments.new(from: arguments).map { Program(arguments: $0) }
    }
}

extension Program {
    public func main(output: inout String) -> ExitCode {
        if self.arguments.help {
            print(self.help(), to: &output)
        } else if self.arguments.version {
            print(self.version(), to: &output)
        } else {
            // TODO: change type(of: ) to Self, after SE-0068 is implemented
            type(of: self).setUp()
            self.runStopWatch()
        }
        return 0
    }

    private func runStopWatch() {
        print("""
            Controls:
             <Enter> - add new lap
             <Space> - pause/continue
             <Esc>   - quit
            """) // show usage to user
        print()

        var timer = Timer()

        func reportLoop() {
            flushPrint(timer.current.formatted, to: stdout)
            if #available(macOS 10.10, *) {
                DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 0.005) { reportLoop() }
            } else {
                DispatchQueue.global(priority: .high).asyncAfter(deadline: .now() + 0.005) { reportLoop() }
            }
        }
        reportLoop()

        timer.start()
        while true {
            guard let input = readCharacter(from: .standardInput) else { continue }
            if input.isStop { break }
            else if input.isPause { timer.toggle() }
            else if input.isLap { lap(stdout) }
        }
        timer.stop()
        lap(stdout)
    }
}

func lap(_ file: UnsafeMutablePointer<FILE>) {
    let line = "\n"
    let chars = line.data(using: .utf8).map { $0.map { Int32($0) } } ?? []
    chars.forEach { fputc($0, file) }
    fflush(file)
}

extension Program {
    private func help() -> String {
        return self.arguments.usage
    }

    private func version() -> String {
        return """
            StopWatch - CLI stopwatch application
            version: 0.2.1
            """
    }
}

extension Program {
    private static func setUp() {
        // setup *unbuffered* standard input
        setbuf(stdin, nil)
        setvbuf(stdin, nil, _IONBF, 0)
        var input = termios()
        tcgetattr(fileno(stdin), &input)
        input.c_lflag = tcflag_t(Int32(input.c_lflag) & ~ICANON)
        input.c_lflag = tcflag_t(Int32(input.c_lflag) & ~ECHO)
        tcsetattr(fileno(stdin), TCSANOW, &input)
    }
}

// swiftlint:disable:next no_extension_access_modifier
private extension Character {
    var isPause: Bool { return self == Character(" ") }
    var isLap: Bool { return self == Character("\r") || self == Character("\n") }
    var isStop: Bool { return self == Character("\u{1B}") } // esc
}

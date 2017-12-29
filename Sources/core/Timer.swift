//
// This file is part of Stopwatch which is released under MIT license.
// See file LICENSE.txt or go to https://github.com/matejkosiarcik/Stopwatch for full license details.
//

import Foundation

public struct Timer {
    public private(set) var status = Status.stopped
    private var previous: TimeInterval = 0

    public init() {}
}

extension Timer {
    public var current: TimeInterval {
        switch self.status {
        case .running(let start): return self.previous + abs(start.timeIntervalSinceNow)
        case .stopped: return self.previous
        }
    }
}

extension Timer {
    public mutating func start() {
        switch self.status {
        case .stopped: self.status = .running(Date())
        default: break // do not start when already running
        }
    }

    public mutating func stop() {
        switch self.status {
        case .running(let start): self.previous += abs(start.timeIntervalSinceNow); self.status = .stopped
        default: break // do not stop when already stopped
        }
    }

    public mutating func toggle() {
        switch self.status {
        case .running: self.stop()
        case .stopped: self.start()
        }
    }
}

extension Timer {
    public enum Status {
        case running(Date)
        case stopped
    }
}

extension Timer.Status: Equatable {
    public static func == (lhs: Timer.Status, rhs: Timer.Status) -> Bool {
        switch (lhs, rhs) {
        case (.running(let x), .running(let y)): return x == y
        case (.stopped, .stopped): return true
        default: return false
        }
    }
}

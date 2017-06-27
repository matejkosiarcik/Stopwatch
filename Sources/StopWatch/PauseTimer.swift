//
// PauseTimer.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import Foundation

public final class PauseTimer {
    private let onUpdate: (TimeInterval) -> Void
    private var simpleTimer: SimpleTimer? = nil
    private var previousRuns: TimeInterval = 0

    public init(each updateInterval: TimeInterval, onUpdate: @escaping (TimeInterval) -> Void) {
        self.onUpdate = onUpdate
        self.simpleTimer = SimpleTimer(each: updateInterval) { onUpdate($0 + self.previousRuns) }
    }
}

extension PauseTimer {
    public var isActive: Bool {
        return self.simpleTimer?.isActive ?? false
    }
}

//extension PauseTimer {
//    private func update(interval: TimeInterval) {
//        self.onUpdate(interval + self.previousRuns)
//    }
//}

extension PauseTimer {
    public func start() {
        self.simpleTimer?.start()
    }

    @discardableResult
    public func stop() -> TimeInterval {
        let end = self.simpleTimer?.stop() ?? 0
        self.previousRuns += end
        return self.previousRuns
    }
}

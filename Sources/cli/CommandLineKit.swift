//
// This file is part of Stopwatch which is released under MIT license.
// See file LICENSE.txt or go to https://github.com/matejkosiarcik/Stopwatch for full license details.
//

import CommandLineKit

extension CommandLineKit.CommandLine {
    var usage: String {
        var usage = ""
        self.printUsage(&usage)
        return usage
    }
}

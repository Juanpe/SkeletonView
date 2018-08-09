
// Copyright © 2018 SkeletonView. All rights reserved.

import Foundation

enum SkeletonEnvironmentKey: String {
    case debugMode = "SKELETON_DEBUG"
}

extension Dictionary {
    subscript (_ key: SkeletonEnvironmentKey) -> Value? {
        return self[key.rawValue as! Key]
    }
}

func log(_ message: String) {
    if let _ = ProcessInfo.processInfo.environment[.debugMode] {
        print(message)
    }
}

extension CustomStringConvertible {
    var skeletonDescription : String {
        return "***** \(type(of: self)) - <\(unsafeBitCast(self, to: Int.self))>***** \n"
    }
}

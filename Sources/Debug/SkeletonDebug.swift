
// Copyright © 2018 SkeletonView. All rights reserved.

import Foundation
import UIKit

enum SkeletonEnvironmentKey: String {
    case debugMode = "SKELETON_DEBUG"
}

extension Dictionary {
    subscript (_ key: SkeletonEnvironmentKey) -> Value? {
        return self[key.rawValue as! Key]
    }
}

func printSkeletonHierarchy(in view: UIView) {
    skeletonLog(view.skeletonHierarchy())
}

func skeletonLog(_ message: String) {
    if let _ = ProcessInfo.processInfo.environment[.debugMode] {
        print(message)
    }
}

extension UIView {

    public func skeletonDescription(short: Bool = false) -> String {
        var description = "<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())"
        let subSkeletons = subviewsSkeletonables
        if !short, subSkeletons.count != 0 {
            description += " | (\(subSkeletons.count)) subSkeletons"
        }
        if isSkeletonable {
            description += " | ☠️ "
        }
        return description + ">"
    }

    public func skeletonHierarchy(index: Int = 0) -> String {
        var description = index == 0 ? "\n ⬇⬇ ☠️ Root view hierarchy with Skeletons ⬇⬇ \n" : ""
        description += "\(index == 0 ? "\n" : "   ") \(skeletonDescription()) \n"
        subviewsToSkeleton.forEach {
            description += String(repeating: " ", count: index)
            description += $0.skeletonHierarchy(index: index + 3)
        }
        return description
    }
}

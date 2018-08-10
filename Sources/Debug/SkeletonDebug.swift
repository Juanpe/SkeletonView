
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

func log(_ message: String) {
    if let _ = ProcessInfo.processInfo.environment[.debugMode] {
        print(message)
    }
}

extension UIView {
    public func skeletonHierarchy(index: Int = 0, onlySkeleletons: Bool = true) -> String {
        var description = index == 0 ? "\n\n ------------------ [☠️](Hierarchy) ------------------ \n " : ""
        description += "\(index == 0 ? "\n" : "   ")<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())> "
        if self.subviewsSkeletonables.count != 0 {
            description += "with [\(self.subviewsSkeletonables.count)] subSkeletons:"
        } else {
            description = "    ☠️ - " + description.replacingOccurrences(of: " ", with: "")
        }
        description += "\n"
        (onlySkeleletons ? self.subviews : self.subviewsSkeletonables).forEach {
            description += String(repeating: " ", count: index)
            description += $0.skeletonHierarchy(index: index + 3)
        }
        return description
    }
    
    public func allViewsHierarchy(index: Int = 0) -> String {
        var description = "\(index == 0 ? "\n" : "   ")<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())> "
        if self.subviewsSkeletonables.count != 0 {
            description += "with [\(self.subviewsSkeletonables.count)] subSkeletons:"
        } else {
            description = "    \(self.isSkeletonable ? "☠️ - " : "")" + description.replacingOccurrences(of: " ", with: "")
        }
        description += "\n"
        self.subviews.forEach {
            description += String(repeating: " ", count: index)
            description += $0.allViewsHierarchy(index: index + 3)
        }
        return description
    }
}

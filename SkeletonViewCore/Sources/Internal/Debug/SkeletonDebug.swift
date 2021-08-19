//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonDebug.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import Foundation
import UIKit

enum SkeletonEnvironmentKey: String {
    case debugMode = "SKELETON_DEBUG"
}

extension Dictionary {
    subscript (_ key: SkeletonEnvironmentKey) -> Value? {
        // swiftlint:disable:next force_cast
        return self[key.rawValue as! Key]
    }
}

func printSkeletonHierarchy(in view: UIView) {
    skeletonLog(view.skeletonHierarchy())
}

func skeletonLog(_ message: String) {
    #if DEBUG
    if ProcessInfo.processInfo.environment[.debugMode] != nil {
        print(message)
    }
    #endif
}

extension UIView {

    func skeletonHierarchy(indentationLevel level: Int = 0) -> String {
        var description = level == 0 ? "\n ⬇⬇ ☠️ Root view hierarchy with Skeletons ⬇⬇ \n" : ""
        description += "\(level == 0 ? "\n" : 3.whitespaces) \(skeletonDescription) \n"
        subviewsToSkeleton.forEach {
            description += (level + 2).whitespaces
            description += $0.skeletonHierarchy(indentationLevel: level + 1)
        }
        return description
    }
    
}

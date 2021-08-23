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

func skeletonLog(_ message: String) {
    #if DEBUG
    if ProcessInfo.processInfo.environment[.debugMode] != nil {
        print(message)
    }
    #endif
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  DispatchQueue+Extensions.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import Foundation

extension DispatchQueue {
    
    private static var _onceTracker = [String]()

    class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        guard !_onceTracker.contains(token) else { return }

        _onceTracker.append(token)
        block()
    }

    class func removeOnce(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        guard let index = _onceTracker.firstIndex(of: token) else { return }
        _onceTracker.remove(at: index)
        block()
    }
    
}

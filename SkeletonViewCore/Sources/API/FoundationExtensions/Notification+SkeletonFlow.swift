//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  Notification+SkeletonFlow.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import Foundation

public extension Notification.Name {
    
    static let skeletonWillAppearNotification = Notification.Name("skeletonWillAppear")
    static let skeletonDidAppearNotification = Notification.Name("skeletonDidAppear")
    static let skeletonWillUpdateNotification = Notification.Name("skeletonWillUpdate")
    static let skeletonDidUpdateNotification = Notification.Name("skeletonDidUpdate")
    static let skeletonWillDisappearNotification = Notification.Name("skeletonWillDisappear")
    static let skeletonDidDisappearNotification = Notification.Name("skeletonDidDisappear")
    
}

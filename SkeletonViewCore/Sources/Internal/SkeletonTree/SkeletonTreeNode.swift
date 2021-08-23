//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonTreeNode.swift
//
//  Created by Juanpe Catalán on 23/8/21.

import UIKit

public struct SkeletonTreeNode<Base> {
    /// Base object to extend.
    let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    init(_ base: Base) {
        self.base = base
    }

}

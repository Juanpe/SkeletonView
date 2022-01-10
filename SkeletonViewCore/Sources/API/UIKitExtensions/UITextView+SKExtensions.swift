//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UITextView+SKExtensions.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

public extension UITextView {

    /// Defines the skeleton paddings.
    var skeletonPaddingInsets: UIEdgeInsets {
        get {
            paddingInsets
        }
        set {
            paddingInsets = newValue
        }
    }
    
    /// Defines the logic for calculating the height of the skeleton lines.
    /// Default: `SkeletonAppearance.default.textLineHeight`
    var skeletonTextLineHeight: SkeletonTextLineHeight {
        get {
            textLineHeight
        }
        set {
            textLineHeight = newValue
        }
    }
    
    /// Defines the logic for calculating the number of lines of the skeleton.
    /// Default: `inherited`
    var skeletonTextNumberOfLines: SkeletonTextNumberOfLines {
        get {
            skeletonNumberOfLines
        }
        set {
            skeletonNumberOfLines = newValue
        }
    }
    
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonTextLineHeight.swift
//
//  Created by Juanpe Catalán on 22/11/21.

import UIKit

public enum SkeletonTextLineHeight: Equatable {
    
    /// Calculates the line height based on the font line height.
    case relativeToFont
    
    /// Calculates the line height based on the height constraints.
    ///
    /// If no constraints exist, the height will be set to the `multilineHeight`
    /// value defined in the `SkeletonAppearance`.
    case relativeToConstraints
    
    /// Returns the specific height specified as the associated value.
    case fixed(CGFloat)
    
}

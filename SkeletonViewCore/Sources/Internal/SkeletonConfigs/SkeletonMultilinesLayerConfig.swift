//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonMultilinesLayerConfig.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

struct SkeletonMultilinesLayerConfig {
    
    var lines: Int
    var lineHeight: CGFloat
    var type: SkeletonType
    var lastLineFillPercent: Int
    var multilineCornerRadius: Int
    var multilineSpacing: CGFloat
    var paddingInsets: UIEdgeInsets
    var alignment: NSTextAlignment
    var isRTL: Bool
    
    /// Returns padding insets taking into account if the RTL is activated
    var calculatedPaddingInsets: UIEdgeInsets {
        UIEdgeInsets(top: paddingInsets.top,
                     left: isRTL ? paddingInsets.right : paddingInsets.left,
                     bottom: paddingInsets.bottom,
                     right: isRTL ? paddingInsets.left : paddingInsets.right)
    }
    
}

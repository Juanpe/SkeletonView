//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  GradientDirection.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

public enum GradientDirection {
    
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    
    public func slidingAnimation(duration: CFTimeInterval = 1.5, autoreverses: Bool = false) -> SkeletonLayerAnimation {
        return SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: self, duration: duration, autoreverses: autoreverses)
    }
    
}

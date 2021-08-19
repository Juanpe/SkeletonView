//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonType.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

public enum SkeletonType {
    
    case solid
    case gradient
    
    var layer: CALayer {
        switch self {
        case .solid:
            return CALayer()
        case .gradient:
            return CAGradientLayer()
        }
    }
    
    func defaultLayerAnimation(isRTL: Bool) -> SkeletonLayerAnimation {
        switch self {
        case .solid:
            return { $0.pulse }
        case .gradient:
            return { SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: isRTL ? .rightLeft : .leftRight) }()
        }
    }
    
}

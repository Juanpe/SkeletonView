//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  CALayer+Animations.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

public extension CALayer {
    
    var pulse: CAAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = backgroundColor
        
        // swiftlint:disable:next force_unwrapping
        pulseAnimation.toValue = UIColor(cgColor: backgroundColor!).complementaryColor.cgColor
        pulseAnimation.duration = 1
        if #available(iOS 12.0, *) {
            pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        } else {
            pulseAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0.0, 0.58, 1.0)
        }
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        pulseAnimation.isRemovedOnCompletion = false
        return pulseAnimation
    }
    
}

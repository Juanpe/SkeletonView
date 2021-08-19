//
//  SkeletonAnimationBuilder.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 17/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation

public class SkeletonAnimationBuilder {
    
    public init() { }
    
    public func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5, autoreverses: Bool = false) -> SkeletonLayerAnimation {
        { _ in
            let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
            startPointAnim.fromValue = direction.startPoint.from
            startPointAnim.toValue = direction.startPoint.to
            
            let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
            endPointAnim.fromValue = direction.endPoint.from
            endPointAnim.toValue = direction.endPoint.to
            
            let animGroup = CAAnimationGroup()
            animGroup.animations = [startPointAnim, endPointAnim]
            animGroup.duration = duration
            animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
            animGroup.repeatCount = .infinity
            animGroup.autoreverses = autoreverses
            animGroup.isRemovedOnCompletion = false
            
            return animGroup
        }
    }
    
}

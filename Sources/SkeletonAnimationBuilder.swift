//
//  SkeletonAnimationBuilder.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 17/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

typealias GradientAnimationPoint = (from: CGPoint, to: CGPoint)

public enum GradientDirection {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    
    public func slidingAnimation(duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation {
        return SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: self, duration: duration)
    }

    // codebeat:disable[ABC]
    var startPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x:-1, y:0.5), to: CGPoint(x:1, y:0.5))
        case .rightLeft:
            return (from: CGPoint(x:1, y:0.5), to: CGPoint(x:-1, y:0.5))
        case .topBottom:
            return (from: CGPoint(x:0.5, y:-1), to: CGPoint(x:0.5, y:1))
        case .bottomTop:
            return (from: CGPoint(x:0.5, y:1), to: CGPoint(x:0.5, y:-1))
        case .topLeftBottomRight:
            return (from: CGPoint(x:-1, y:-1), to: CGPoint(x:1, y:1))
        case .bottomRightTopLeft:
            return (from: CGPoint(x:1, y:1), to: CGPoint(x:-1, y:-1))
        }
    }
    
    var endPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x:0, y:0.5), to: CGPoint(x:2, y:0.5))
        case .rightLeft:
            return ( from: CGPoint(x:2, y:0.5), to: CGPoint(x:0, y:0.5))
        case .topBottom:
            return ( from: CGPoint(x:0.5, y:0), to: CGPoint(x:0.5, y:2))
        case .bottomTop:
            return ( from: CGPoint(x:0.5, y:2), to: CGPoint(x:0.5, y:0))
        case .topLeftBottomRight:
            return ( from: CGPoint(x:0, y:0), to: CGPoint(x:2, y:2))
        case .bottomRightTopLeft:
            return ( from: CGPoint(x:2, y:2), to: CGPoint(x:0, y:0))
        }
    }
    // codebeat:enable[ABC]
}

public class SkeletonAnimationBuilder {
    public init() { }
    
    public func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation {
        return { layer in
            
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
            animGroup.isRemovedOnCompletion = false
            
            return animGroup
        }
    }
}

//
//  SkeletonAnimationBuilder.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

typealias GradientAnimationPoint = (from: NSPoint, to: NSPoint)

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
    
    var startPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: NSPoint(x:-1, y:0.5), to: NSPoint(x:1, y:0.5))
        case .rightLeft:
            return (from: NSPoint(x:1, y:0.5), to: NSPoint(x:-1, y:0.5))
        case .topBottom:
            return (from: NSPoint(x:0.5, y:-1), to: NSPoint(x:0.5, y:1))
        case .bottomTop:
            return (from: NSPoint(x:0.5, y:1), to: NSPoint(x:0.5, y:-1))
        case .topLeftBottomRight:
            return (from: NSPoint(x:-1, y:-1), to: NSPoint(x:1, y:1))
        case .bottomRightTopLeft:
            return (from: NSPoint(x:1, y:1), to: NSPoint(x:-1, y:-1))
        }
    }
    
    var endPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: NSPoint(x:0, y:0.5), to: NSPoint(x:2, y:0.5))
        case .rightLeft:
            return ( from: NSPoint(x:2, y:0.5), to: NSPoint(x:0, y:0.5))
        case .topBottom:
            return ( from: NSPoint(x:0.5, y:0), to: NSPoint(x:0.5, y:2))
        case .bottomTop:
            return ( from: NSPoint(x:0.5, y:2), to: NSPoint(x:0.5, y:0))
        case .topLeftBottomRight:
            return ( from: NSPoint(x:0, y:0), to: NSPoint(x:2, y:2))
        case .bottomRightTopLeft:
            return ( from: NSPoint(x:2, y:2), to: NSPoint(x:0, y:0))
        }
    }
}

public class SkeletonAnimationBuilder {
    
    public init() {
    }
    
    public func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation {
        return { layer in
            
            let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
            startPointAnim.fromValue = NSValue(point: direction.startPoint.from)
            startPointAnim.toValue = NSValue(point: direction.startPoint.to)
            
            let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
            endPointAnim.fromValue = NSValue(point: direction.endPoint.from)
            endPointAnim.toValue = NSValue(point: direction.endPoint.to)
            
            let animGroup = CAAnimationGroup()
            animGroup.animations = [startPointAnim, endPointAnim]
            animGroup.duration = duration
            animGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            animGroup.repeatCount = .infinity
            
            return animGroup
        }
    }
}

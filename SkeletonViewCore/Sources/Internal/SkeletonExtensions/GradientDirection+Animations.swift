//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  GradientDirection+Animations.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

typealias GradientAnimationPoint = (from: CGPoint, to: CGPoint)

extension GradientDirection {
    
    // codebeat:disable[ABC]
    var startPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x: -1, y: 0.5), to: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (from: CGPoint(x: 1, y: 0.5), to: CGPoint(x: -1, y: 0.5))
        case .topBottom:
            return (from: CGPoint(x: 0.5, y: -1), to: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (from: CGPoint(x: 0.5, y: 1), to: CGPoint(x: 0.5, y: -1))
        case .topLeftBottomRight:
            return (from: CGPoint(x: -1, y: -1), to: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (from: CGPoint(x: 1, y: 1), to: CGPoint(x: -1, y: -1))
        }
    }
    
    var endPoint: GradientAnimationPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x: 0, y: 0.5), to: CGPoint(x: 2, y: 0.5))
        case .rightLeft:
            return ( from: CGPoint(x: 2, y: 0.5), to: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return ( from: CGPoint(x: 0.5, y: 0), to: CGPoint(x: 0.5, y: 2))
        case .bottomTop:
            return ( from: CGPoint(x: 0.5, y: 2), to: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return ( from: CGPoint(x: 0, y: 0), to: CGPoint(x: 2, y: 2))
        case .bottomRightTopLeft:
            return ( from: CGPoint(x: 2, y: 2), to: CGPoint(x: 0, y: 0))
        }
    }
    // codebeat:enable[ABC]
    
}

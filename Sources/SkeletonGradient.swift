//
//  SkeletonGradient.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 05/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

typealias GradientVector = (x: CGPoint, y: CGPoint)

public enum GradientDirection {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    
    var vector: GradientVector {
        switch self {
        case .leftRight:
            return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))
        }
    }
}

public struct SkeletonGradient {
    
    private var gradientColors: [UIColor]
    public var direction: GradientDirection
    
    public var colors: [UIColor] {
        return gradientColors
    }
    
    public init(baseColor: UIColor, secondaryColor: UIColor? = nil, direction: GradientDirection = .leftRight) {
        if let secondary = secondaryColor {
            self.gradientColors = [baseColor, secondary, baseColor]
        } else {
            self.gradientColors = baseColor.makeGradient()
        }
        self.direction = direction
    }
}

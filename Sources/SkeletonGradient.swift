//
//  SkeletonGradient.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 05/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public struct SkeletonGradient {
    
    private var gradientColors: [UIColor]
    
    public var colors: [UIColor] {
        return gradientColors
    }
    
    public init(baseColor: UIColor, secondaryColor: UIColor? = nil) {
        if let secondary = secondaryColor {
            self.gradientColors = [baseColor, secondary, baseColor]
        } else {
            self.gradientColors = baseColor.makeGradient()
        }
    }
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonGradient.swift
//
//  Created by Juanpe Catalán on 05/11/2017.

import UIKit

public struct SkeletonGradient {
    
    private let gradientColors: [UIColor]
    
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
    
    public init(colors: [UIColor]) {
        self.gradientColors = colors
    }
    
}

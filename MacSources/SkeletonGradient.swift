//
//  SkeletonGradient.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

public struct SkeletonGradient {
    
    private var gradientColors: [NSColor]
    
    public var colors: [NSColor] {
        return gradientColors
    }
    
    public init(baseColor: NSColor, secondaryColor: NSColor? = nil) {
        if let secondary = secondaryColor {
            self.gradientColors = [baseColor, secondary, baseColor]
        } else {
            self.gradientColors = baseColor.makeGradient()
        }
    }
}

//
//  SkeletonDefaultConfig.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

public enum SkeletonDefaultConfig {
    
    public static let tintColor = SkeletonColor.clouds
    
    public static let gradient = SkeletonGradient(baseColor: tintColor)
    
    public static let multilineHeight: CGFloat = 15
    
    public static let multilineSpacing: CGFloat = 10
    
    public static let multilineLastLineFillPercent = 70
}

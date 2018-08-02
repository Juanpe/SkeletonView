//
//  SkeletonConfig.shared.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public struct SkeletonConfig {
    
    // MARK: - Defaults
    
    public static var shared = SkeletonConfig(
            tintColor: .clouds,
            gradient: SkeletonGradient(baseColor: .clouds),
            multilineHeight: 15,
            multilineSpacing: 10,
            multilineLastLineFillPercent: 70,
            multilineCornerRadius: 0
        )
    
    // MARK: - Properties
    
    public var tintColor: UIColor
    
    public var gradient: SkeletonGradient
    
    public var multilineHeight: CGFloat
    
    public var multilineSpacing: CGFloat
    
    public var multilineLastLineFillPercent: Int
    
    public var multilineCornerRadius: Int
}

//
//  SkeletonDefaultConfig.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public enum SkeletonDefaultConfig {
        
        public static let tintColor = UIColor.clouds
        
        public static let gradient = SkeletonGradient(baseColor: tintColor)
        
        public static let multilineHeight: CGFloat = 15
        
        public static let multilineSpacing: CGFloat = 10
        
        public static let multilineLastLineFillPercent = 70
        
        public static let multilineCornerRadius = 0
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonAppearance.swift
//

import UIKit

public enum SkeletonAppearance {
    public static var `default` = SkeletonViewAppearance.shared
}

// codebeat:disable[TOO_MANY_IVARS]
public class SkeletonViewAppearance {
    
    static var shared = SkeletonViewAppearance()

    public var tintColor: UIColor = .skeletonDefault

    public var gradient = SkeletonGradient(baseColor: .skeletonDefault)

    public var multilineHeight: CGFloat = 15
    
    public lazy var textLineHeight: SkeletonTextLineHeight = .fixed(SkeletonAppearance.default.multilineHeight)
    
    public var multilineSpacing: CGFloat = 10

    public var multilineLastLineFillPercent: Int = 70

    public var multilineCornerRadius: Int = 0

    public var renderSingleLineAsView: Bool = false
    
}
// codebeat:enable[TOO_MANY_IVARS]

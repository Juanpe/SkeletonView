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
    static var `default` = SkeletonViewAppearance.shared
}

// codebeat:disable[TOO_MANY_IVARS]
public class SkeletonViewAppearance {
    
    static var shared = SkeletonViewAppearance()

    var tintColor: UIColor = .skeletonDefault

    var gradient = SkeletonGradient(baseColor: .skeletonDefault)

    var multilineHeight: CGFloat = 15

    var multilineSpacing: CGFloat = 10

    var multilineLastLineFillPercent: Int = 70

    var multilineCornerRadius: Int = 0

    var renderSingleLineAsView: Bool = false
    
}
// codebeat:enable[TOO_MANY_IVARS]

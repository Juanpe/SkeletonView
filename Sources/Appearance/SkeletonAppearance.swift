//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public protocol Appearance {
    var tintColor: UIColor { get set }
    var gradient: SkeletonGradient { get set }
    var multilineHeight: CGFloat { get set }
    var multilineSpacing: CGFloat { get set }
    var multilineLastLineFillPercent: Int { get set }
    var multilineCornerRadius: Int { get set }
}

public enum SkeletonAppearance {
    public static var `default`: Appearance = SkeletonViewAppearance.shared
}

// codebeat:disable[TOO_MANY_IVARS]
class SkeletonViewAppearance: Appearance {

    static var shared = SkeletonViewAppearance()

    var tintColor: UIColor = .clouds

    var gradient: SkeletonGradient = SkeletonGradient(baseColor: .clouds)

    var multilineHeight: CGFloat = 15

    var multilineSpacing: CGFloat = 10

    var multilineLastLineFillPercent: Int = 70

    var multilineCornerRadius: Int = 0
}
// codebeat:enable[TOO_MANY_IVARS]

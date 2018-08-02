//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public protocol SkeletonAppearance {
    var defaultTintColor: UIColor { get set }
    var defaultGradient: SkeletonGradient { get set }
    var multilineHeight: CGFloat { get set }
    var multilineSpacing: CGFloat { get set }
    var multilineLastLineFillPercent: Int { get set }
    var multilineCornerRadius: Int { get set }
}

public protocol Customizable {
    static var appearance: SkeletonAppearance { get }
}

class SkeletonViewAppearance: SkeletonAppearance {

    static var shared = SkeletonViewAppearance()

    var defaultTintColor: UIColor = .clouds

    var defaultGradient: SkeletonGradient = SkeletonGradient(baseColor: .clouds)

    var multilineHeight: CGFloat = 15

    var multilineSpacing: CGFloat = 10

    var multilineLastLineFillPercent: Int = 70

    var multilineCornerRadius: Int = 0
}

//public struct SkeletonConfig {
//    
//    // MARK: - Defaults
//    
//    public static var shared = SkeletonConfig(
//            tintColor: .clouds,
//            gradient: SkeletonGradient(baseColor: .clouds),
//            multilineHeight: 15,
//            multilineSpacing: 10,
//            multilineLastLineFillPercent: 70,
//            multilineCornerRadius: 0
//        )
//    
//    // MARK: - Properties
//    
//    public var tintColor: UIColor
//    
//    public var gradient: SkeletonGradient
//    
//    public var multilineHeight: CGFloat
//    
//    public var multilineSpacing: CGFloat
//    
//    public var multilineLastLineFillPercent: Int
//    
//    public var multilineCornerRadius: Int
//}

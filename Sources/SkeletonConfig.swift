// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Struct who contains the config needed to activate the skeleton layer
/// in a view
struct SkeletonConfig {
    let type: SkeletonType
    let colors: [UIColor]
    let gradientDirection: GradientDirection?
    let animated: Bool
    let animation: SkeletonLayerAnimation?
}

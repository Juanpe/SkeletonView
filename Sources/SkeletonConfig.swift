// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Used to store all config needed to activate the skeleton layer.
struct SkeletonConfig {
    /// Type of skeleton layer
    let type: SkeletonType
    /// Colors used in skeleton layer
    let colors: [UIColor]
    /// If type is gradient, which gradient direction
    let gradientDirection: GradientDirection?
    /// Specify if skeleton is animated or not
    let animated: Bool
    /// Used to execute a custom animation
    let animation: SkeletonLayerAnimation?
    //  If the skeletons should fade in
    var fadeIn:Bool { get { return fadeInDuration != 0 }}
    //  If the skeletons should fade out
    var fadeOut:Bool { get { return fadeOutDuration != 0 }}
    //  Duration of fade in
    let fadeInDuration:Double
    //  Duration of fade out
    let fadeOutDuration:Double
    
    
    init(
        type: SkeletonType,
        colors: [UIColor],
        gradientDirection: GradientDirection? = nil,
        animated: Bool = false,
        animation: SkeletonLayerAnimation? = nil,
        fadeInDuration: Double = 0,
        fadeOutDuration: Double = 0
        ) {
        self.type = type
        self.colors = colors
        self.gradientDirection = gradientDirection
        self.animated = animated
        self.animation = animation
        self.fadeInDuration = fadeInDuration
        self.fadeOutDuration = fadeOutDuration
    }
}

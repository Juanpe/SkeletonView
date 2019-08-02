// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Used to store all config needed to activate the skeleton layer.
struct SkeletonConfig: Hashable {
    
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
    //  Transition type
    fileprivate var _transition:SkeletonTransitionStyle = .none
    var transition:SkeletonTransitionStyle {
        get {
            return _transition
        }
        set {
            switch newValue {
            case .fade(duration: let duration):
                if duration <= 0 {
                    _transition = .none
                }
                else {
                    _transition = newValue
                }
            default:
                _transition = newValue
            }
        }
    }
    
    
    init(
        type: SkeletonType,
        colors: [UIColor],
        gradientDirection: GradientDirection? = nil,
        animated: Bool = false,
        animation: SkeletonLayerAnimation? = nil,
        transition: SkeletonTransitionStyle = .none
        ) {
        self.type = type
        self.colors = colors
        self.gradientDirection = gradientDirection
        self.animated = animated
        self.animation = animation
        self.transition = transition
    }
    
    //Make equatable
    static func == (lhs: SkeletonConfig, rhs: SkeletonConfig) -> Bool {
        return lhs.type == rhs.type && lhs.colors == rhs.colors && lhs.gradientDirection == rhs.gradientDirection && lhs.animated == rhs.animated
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}

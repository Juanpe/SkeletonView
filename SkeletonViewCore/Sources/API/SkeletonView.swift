//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  PublicSkeletonView.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

public extension UIView {
    /// Shows the skeleton without animation using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - color: The color of the skeleton. Defaults to `SkeletonAppearance.default.tintColor`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        let config = SkeletonConfig(type: .solid, colors: [color], transition: transition)
        showSkeleton(skeletonConfig: config)
    }
    
    /// Shows the skeleton using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - color: The color of the skeleton. Defaults to `SkeletonAppearance.default.tintColor`.
    ///   - animated: If the skeleton is animated or not. Defaults to `true`.
    ///   - delay: The amount of time (measured in seconds) to wait before show the skeleton.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animated: Bool = true, delay: TimeInterval, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        
        _delayedShowSkeletonWorkItem = DispatchWorkItem { [weak self] in
            let config = SkeletonConfig(type: .solid, colors: [color], animated: animated, transition: transition)
            self?.showSkeleton(skeletonConfig: config)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: _delayedShowSkeletonWorkItem!)
    }
    
    /// Shows the gradient skeleton without animation using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - gradient: The gradient of the skeleton. Defaults to `SkeletonAppearance.default.gradient`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        let config = SkeletonConfig(type: .gradient, colors: gradient.colors, transition: transition)
        showSkeleton(skeletonConfig: config)
    }
    
    /// Shows the gradient skeleton using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - gradient: The gradient of the skeleton. Defaults to `SkeletonAppearance.default.gradient`.
    ///   - animated: If the skeleton is animated or not. Defaults to `true`.
    ///   - delay: The amount of time (measured in seconds) to wait before show the skeleton.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showGradientSkeleton(
        usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient,
        animated: Bool = true,
        delay: TimeInterval,
        transition: SkeletonTransitionStyle = .crossDissolve(0.25)
    ) {
        _delayedShowSkeletonWorkItem?.cancel()
        
        _delayedShowSkeletonWorkItem = DispatchWorkItem { [weak self] in
            let config = SkeletonConfig(type: .gradient, colors: gradient.colors, animated: animated, transition: transition)
            self?.showSkeleton(skeletonConfig: config)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: _delayedShowSkeletonWorkItem!)
    }
    
    /// Shows the animated skeleton using the view that calls this method as root view.
    ///
    /// If animation is nil, sliding animation will be used, with direction left to right.
    ///
    /// - Parameters:
    ///   - color: The color of skeleton. Defaults to `SkeletonAppearance.default.tintColor`.
    ///   - animation: The animation of the skeleton. Defaults to `nil`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showAnimatedSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animation: SkeletonLayerAnimation? = nil, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        let config = SkeletonConfig(type: .solid, colors: [color], animated: true, animation: animation, transition: transition)
        showSkeleton(skeletonConfig: config)
    }
    
    /// Shows the gradient skeleton without animation using the view that calls this method as root view.
    ///
    /// If animation is nil, sliding animation will be used, with direction left to right.
    ///
    /// - Parameters:
    ///   - gradient: The gradient of the skeleton. Defaults to `SkeletonAppearance.default.gradient`.
    ///   - animation: The animation of the skeleton. Defaults to `nil`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, animation: SkeletonLayerAnimation? = nil, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        let config = SkeletonConfig(type: .gradient, colors: gradient.colors, animated: true, animation: animation, transition: transition)
        showSkeleton(skeletonConfig: config)
    }

    func updateSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor) {
        let config = SkeletonConfig(type: .solid, colors: [color])
        updateSkeleton(skeletonConfig: config)
    }

    func updateGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient) {
        let config = SkeletonConfig(type: .gradient, colors: gradient.colors)
        updateSkeleton(skeletonConfig: config)
    }

    func updateAnimatedSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animation: SkeletonLayerAnimation? = nil) {
        let config = SkeletonConfig(type: .solid, colors: [color], animated: true, animation: animation)
        updateSkeleton(skeletonConfig: config)
    }

    func updateAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, animation: SkeletonLayerAnimation? = nil) {
        let config = SkeletonConfig(type: .gradient, colors: gradient.colors, animated: true, animation: animation)
        updateSkeleton(skeletonConfig: config)
    }

    func layoutSkeletonIfNeeded() {
        _flowDelegate?.willBeginLayingSkeletonsIfNeeded(rootView: self)
        recursiveLayoutSkeletonIfNeeded(root: self)
    }
    
    func hideSkeleton(reloadDataAfter reload: Bool = true, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        _delayedShowSkeletonWorkItem?.cancel()
        _flowDelegate?.willBeginHidingSkeletons(rootView: self)
        recursiveHideSkeleton(reloadDataAfter: reload, transition: transition, root: self)
    }
    
    func startSkeletonAnimation(_ anim: SkeletonLayerAnimation? = nil) {
        subviewsSkeletonables.recursiveSearch(leafBlock: startSkeletonLayerAnimationBlock(anim)) { subview in
            subview.startSkeletonAnimation(anim)
        }
    }

    func stopSkeletonAnimation() {
        subviewsSkeletonables.recursiveSearch(leafBlock: stopSkeletonLayerAnimationBlock) { subview in
            subview.stopSkeletonAnimation()
        }
    }
}

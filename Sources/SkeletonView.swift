//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public extension UIView {
    /// Shows the skeleton without animation using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - color: The color of the skeleton. Defaults to `SkeletonAppearance.default.tintColor`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        let config = SkeletonConfig(type: .solid, colors: [color], transition: transition)
        showSkeleton(skeletonConfig: config)
    }
    
    /// Shows the gradient skeleton without animation using the view that calls this method as root view.
    ///
    /// - Parameters:
    ///   - gradient: The gradient of the skeleton. Defaults to `SkeletonAppearance.default.gradient`.
    ///   - transition: The style of the transition when the skeleton appears. Defaults to `.crossDissolve(0.25)`.
    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        let config = SkeletonConfig(type: .gradient, colors: gradient.colors, transition: transition)
        showSkeleton(skeletonConfig: config)
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
        flowDelegate?.willBeginLayingSkeletonsIfNeeded(rootView: self)
        recursiveLayoutSkeletonIfNeeded(root: self)
    }
    
    func hideSkeleton(reloadDataAfter reload: Bool = true, transition: SkeletonTransitionStyle = .crossDissolve(0.25)) {
        flowDelegate?.willBeginHidingSkeletons(rootView: self)
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

extension UIView {
    @objc func skeletonLayoutSubviews() {
        guard Thread.isMainThread else { return }
        skeletonLayoutSubviews()
        guard isSkeletonActive else { return }
        layoutSkeletonIfNeeded()
    }

    @objc func skeletonTraitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        skeletonTraitCollectionDidChange(previousTraitCollection)
        guard isSkeletonable, isSkeletonActive, let config = currentSkeletonConfig else { return }
        updateSkeleton(skeletonConfig: config)
    }
    
    func showSkeleton(skeletonConfig config: SkeletonConfig) {
        isSkeletonAnimated = config.animated
        flowDelegate = SkeletonFlowHandler()
        flowDelegate?.willBeginShowingSkeletons(rootView: self)
        recursiveShowSkeleton(skeletonConfig: config, root: self)
    }

    private func recursiveShowSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        guard isSkeletonable && !isSkeletonActive else { return }
        currentSkeletonConfig = config
        swizzleLayoutSubviews()
        swizzleTraitCollectionDidChange()
        addDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            showSkeletonIfNotActive(skeletonConfig: config)
        }){ subview in
            subview.recursiveShowSkeleton(skeletonConfig: config)
        }

        if let root = root {
            flowDelegate?.didShowSkeletons(rootView: root)
        }
    }

    private func showSkeletonIfNotActive(skeletonConfig config: SkeletonConfig) {
        guard !isSkeletonActive else { return }
        saveViewState()
        isUserInteractionEnabled = false
        prepareViewForSkeleton()
        addSkeletonLayer(skeletonConfig: config)
    }

    func updateSkeleton(skeletonConfig config: SkeletonConfig) {
        isSkeletonAnimated = config.animated
        flowDelegate?.willBeginUpdatingSkeletons(rootView: self)
        recursiveUpdateSkeleton(skeletonConfig: config, root: self)
    }

    private func recursiveUpdateSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        guard isSkeletonActive else { return }
        currentSkeletonConfig = config
        updateDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            if let skeletonLayer = skeletonLayer,
                skeletonLayer.type != config.type {
                removeSkeletonLayer()
                addSkeletonLayer(skeletonConfig: config)
            } else {
                updateSkeletonLayer(skeletonConfig: config)
            }
        }) { subview in
            subview.recursiveUpdateSkeleton(skeletonConfig: config)
        }

        if let root = root {
            flowDelegate?.didUpdateSkeletons(rootView: root)
        }
    }

    private func recursiveLayoutSkeletonIfNeeded(root: UIView? = nil) {
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            guard isSkeletonable, isSkeletonActive else { return }
            layoutSkeletonLayerIfNeeded()
            if let config = currentSkeletonConfig, config.animated, !isSkeletonAnimated {
                startSkeletonAnimation(config.animation)
            }
        }) { subview in
            subview.recursiveLayoutSkeletonIfNeeded()
        }

        if let root = root {
            flowDelegate?.didLayoutSkeletonsIfNeeded(rootView: root)
        }
    }

    private func recursiveHideSkeleton(reloadDataAfter reload: Bool, transition: SkeletonTransitionStyle, root: UIView? = nil) {
        guard isSkeletonActive else { return }
        currentSkeletonConfig?.transition = transition
        isUserInteractionEnabled = true
        removeDummyDataSourceIfNeeded(reloadAfter: reload)
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            recoverViewState(forced: false)
            removeSkeletonLayer()
        }) { subview in
            subview.recursiveHideSkeleton(reloadDataAfter: reload, transition: transition)
        }
        
        if let root = root {
            flowDelegate?.didHideSkeletons(rootView: root)
        }
    }
    
    private func startSkeletonLayerAnimationBlock(_ anim: SkeletonLayerAnimation? = nil) -> VoidBlock {
        return {
            self.isSkeletonAnimated = true
            guard let layer = self.skeletonLayer else { return }
            layer.start(anim) { [weak self] in
                self?.isSkeletonAnimated = false
            }
        }
    }
    
    private var stopSkeletonLayerAnimationBlock: VoidBlock {
        return {
            self.isSkeletonAnimated = false
            guard let layer = self.skeletonLayer else { return }
            layer.stopAnimation()
        }
    }
    
    private func swizzleLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.once(token: "UIView.SkeletonView.swizzleLayoutSubviews") {
                swizzle(selector: #selector(UIView.layoutSubviews),
                        with: #selector(UIView.skeletonLayoutSubviews),
                        inClass: UIView.self,
                        usingClass: UIView.self)
                self.layoutSkeletonIfNeeded()
            }
        }
    }

    private func swizzleTraitCollectionDidChange() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.once(token: "UIView.SkeletonView.swizzleTraitCollectionDidChange") {
                swizzle(selector: #selector(UIView.traitCollectionDidChange(_:)),
                        with: #selector(UIView.skeletonTraitCollectionDidChange(_:)),
                        inClass: UIView.self,
                        usingClass: UIView.self)
            }
        }
    }
}

extension UIView {
    func addSkeletonLayer(skeletonConfig config: SkeletonConfig) {
        guard let skeletonLayer = SkeletonLayerBuilder()
            .setSkeletonType(config.type)
            .addColors(config.colors)
            .setHolder(self)
            .build()
            else { return }

        self.skeletonLayer = skeletonLayer
        layer.insertSublayer(skeletonLayer,
                             at: UInt32.max,
                             transition: config.transition) { [weak self] in
                                if config.animated {
                                    self?.startSkeletonAnimation(config.animation)
                                }
        }
        status = .on
    }
    
    func updateSkeletonLayer(skeletonConfig config: SkeletonConfig) {
        guard let skeletonLayer = skeletonLayer else { return }
        skeletonLayer.update(usingColors: config.colors)
        if config.animated {
            startSkeletonAnimation(config.animation)
        } else {
            skeletonLayer.stopAnimation()
        }
    }

    func layoutSkeletonLayerIfNeeded() {
        guard let skeletonLayer = skeletonLayer else { return }
        skeletonLayer.layoutIfNeeded()
    }
    
    func removeSkeletonLayer() {
        guard isSkeletonActive,
            let skeletonLayer = skeletonLayer,
            let transitionStyle = currentSkeletonConfig?.transition else { return }
        skeletonLayer.stopAnimation()
        skeletonLayer.removeLayer(transition: transitionStyle) {
            self.skeletonLayer = nil
            self.status = .off
            self.currentSkeletonConfig = nil
        }
    }
}

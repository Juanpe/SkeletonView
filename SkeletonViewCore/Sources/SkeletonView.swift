//  Copyright © 2017 SkeletonView. All rights reserved.

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

extension UIView {
    @objc func skeletonLayoutSubviews() {
        guard Thread.isMainThread else { return }
        skeletonLayoutSubviews()
        guard isSkeletonActive else { return }
        layoutSkeletonIfNeeded()
    }

    @objc func skeletonTraitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        skeletonTraitCollectionDidChange(previousTraitCollection)
        guard isSkeletonable, isSkeletonActive, let config = _currentSkeletonConfig else { return }
        updateSkeleton(skeletonConfig: config)
    }
    
    func showSkeleton(skeletonConfig config: SkeletonConfig) {
        _isSkeletonAnimated = config.animated
        _flowDelegate = SkeletonFlowHandler()
        _flowDelegate?.willBeginShowingSkeletons(rootView: self)
        recursiveShowSkeleton(skeletonConfig: config, root: self)
    }

    private func recursiveShowSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        if isHiddenWhenSkeletonIsActive {
            isHidden = true
        }
        guard isSkeletonable && !isSkeletonActive else { return }
        _currentSkeletonConfig = config
        swizzleLayoutSubviews()
        swizzleTraitCollectionDidChange()
        addDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            showSkeletonIfNotActive(skeletonConfig: config)
        }) { subview in
            subview.recursiveShowSkeleton(skeletonConfig: config)
        }

        if let root = root {
            _flowDelegate?.didShowSkeletons(rootView: root)
        }
    }

    private func showSkeletonIfNotActive(skeletonConfig config: SkeletonConfig) {
        guard !isSkeletonActive else { return }
        saveViewState()

        prepareViewForSkeleton()
        addSkeletonLayer(skeletonConfig: config)
    }

    func updateSkeleton(skeletonConfig config: SkeletonConfig) {
        _isSkeletonAnimated = config.animated
        _flowDelegate?.willBeginUpdatingSkeletons(rootView: self)
        recursiveUpdateSkeleton(skeletonConfig: config, root: self)
    }

    private func recursiveUpdateSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        guard isSkeletonActive else { return }
        _currentSkeletonConfig = config
        updateDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            if let skeletonLayer = _skeletonLayer,
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
            _flowDelegate?.didUpdateSkeletons(rootView: root)
        }
    }

    private func recursiveLayoutSkeletonIfNeeded(root: UIView? = nil) {
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            guard isSkeletonable, isSkeletonActive else { return }
            layoutSkeletonLayerIfNeeded()
            if let config = _currentSkeletonConfig, config.animated, !_isSkeletonAnimated {
                startSkeletonAnimation(config.animation)
            }
        }) { subview in
            subview.recursiveLayoutSkeletonIfNeeded()
        }

        if let root = root {
            _flowDelegate?.didLayoutSkeletonsIfNeeded(rootView: root)
        }
    }

    private func recursiveHideSkeleton(reloadDataAfter reload: Bool, transition: SkeletonTransitionStyle, root: UIView? = nil) {
        guard isSkeletonActive else { return }
        if isHiddenWhenSkeletonIsActive {
            isHidden = false
        }
        _currentSkeletonConfig?.transition = transition
        unSwizzleLayoutSubviews()
        unSwizzleTraitCollectionDidChange()
        removeDummyDataSourceIfNeeded(reloadAfter: reload)
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            recoverViewState(forced: false)
            removeSkeletonLayer()
        }) { subview in
            subview.recursiveHideSkeleton(reloadDataAfter: reload, transition: transition)
        }
        
        if let root = root {
            _flowDelegate?.didHideSkeletons(rootView: root)
        }
    }
    
    private func startSkeletonLayerAnimationBlock(_ anim: SkeletonLayerAnimation? = nil) -> VoidBlock {
        return {
            self._isSkeletonAnimated = true
            guard let layer = self._skeletonLayer else { return }
            layer.start(anim) { [weak self] in
                self?._isSkeletonAnimated = false
            }
        }
    }
    
    private var stopSkeletonLayerAnimationBlock: VoidBlock {
        return {
            self._isSkeletonAnimated = false
            guard let layer = self._skeletonLayer else { return }
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

    private func unSwizzleLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.removeOnce(token: "UIView.SkeletonView.swizzleLayoutSubviews") {
                swizzle(selector: #selector(UIView.skeletonLayoutSubviews),
                        with: #selector(UIView.layoutSubviews),
                        inClass: UIView.self,
                        usingClass: UIView.self)
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

    private func unSwizzleTraitCollectionDidChange() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.removeOnce(token: "UIView.SkeletonView.swizzleTraitCollectionDidChange") {
                swizzle(selector: #selector(UIView.skeletonTraitCollectionDidChange(_:)),
                        with: #selector(UIView.traitCollectionDidChange(_:)),
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
        
        self._skeletonLayer = skeletonLayer
        layer.insertSkeletonLayer(
            skeletonLayer,
            atIndex: UInt32.max,
            transition: config.transition
        ) { [weak self] in
            guard let self = self else { return }
            
            /// Workaround to fix the problem when inserting a sublayer and
            /// the content offset is modified by the system.
            (self as? UITextView)?.setContentOffset(.zero, animated: false)
            
            if config.animated {
                self.startSkeletonAnimation(config.animation)
            }
        }
        _status = .on
    }
    
    func updateSkeletonLayer(skeletonConfig config: SkeletonConfig) {
        guard let skeletonLayer = _skeletonLayer else { return }
        skeletonLayer.update(usingColors: config.colors)
        if config.animated {
            startSkeletonAnimation(config.animation)
        } else {
            skeletonLayer.stopAnimation()
        }
    }

    func layoutSkeletonLayerIfNeeded() {
        guard let skeletonLayer = _skeletonLayer else { return }
        skeletonLayer.layoutIfNeeded()
    }
    
    func removeSkeletonLayer() {
        guard isSkeletonActive,
            let skeletonLayer = _skeletonLayer,
            let transitionStyle = _currentSkeletonConfig?.transition else { return }
        skeletonLayer.stopAnimation()
        _status = .off
        skeletonLayer.removeLayer(transition: transitionStyle) {
            self._skeletonLayer = nil
            self._currentSkeletonConfig = nil
        }
    }
}

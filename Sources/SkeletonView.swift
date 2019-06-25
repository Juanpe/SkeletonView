//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public extension UIView {
    
    func showSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor) {
        let config: SkeletonConfig = SkeletonConfig(type: .solid, colors: [color])
        showSkeleton(skeletonConfig: config)
    }
    
    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient) {
        let config: SkeletonConfig = SkeletonConfig(type: .gradient, colors: gradient.colors)
        showSkeleton(skeletonConfig: config)
    }
    
    func showAnimatedSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animation: SkeletonLayerAnimation? = nil) {
        let config: SkeletonConfig = SkeletonConfig(type: .solid, colors: [color], animated: true, animation: animation)
        showSkeleton(skeletonConfig: config)
    }
    
    func showAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, animation: SkeletonLayerAnimation? = nil) {
        let config: SkeletonConfig = SkeletonConfig(type: .gradient, colors: gradient.colors, animated: true, animation: animation)
        showSkeleton(skeletonConfig: config)
    }

    func updateSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor) {
        let config: SkeletonConfig = SkeletonConfig(type: .solid, colors: [color])
        updateSkeleton(skeletonConfig: config)
    }

    func updateGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient) {
        let config: SkeletonConfig = SkeletonConfig(type: .gradient, colors: gradient.colors)
        updateSkeleton(skeletonConfig: config)
    }

    func updateAnimatedSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animation: SkeletonLayerAnimation? = nil) {
        let config: SkeletonConfig = SkeletonConfig(type: .solid, colors: [color], animated: true, animation: animation)
        updateSkeleton(skeletonConfig: config)
    }

    func updateAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, animation: SkeletonLayerAnimation? = nil) {
        let config: SkeletonConfig = SkeletonConfig(type: .gradient, colors: gradient.colors, animated: true, animation: animation)
        updateSkeleton(skeletonConfig: config)
    }

    func layoutSkeletonIfNeeded() {
        guard let flowDelegate = flowDelegate else { return }
        flowDelegate.willBeginLayingSkeletonsIfNeeded(withRootView: self)
        recursiveLayoutSkeletonIfNeeded(root: self)
    }
    
    func hideSkeleton(reloadDataAfter reload: Bool = true) {
        flowDelegate?.willBeginHidingSkeletons(withRootView: self)
        recursiveHideSkeleton(reloadDataAfter: reload, root: self)
    }
    
    func startSkeletonAnimation(_ anim: SkeletonLayerAnimation? = nil) {
        skeletonIsAnimated = true
        subviewsSkeletonables.recursiveSearch(leafBlock: startSkeletonLayerAnimationBlock(anim)) { subview in
            subview.startSkeletonAnimation(anim)
        }
    }

    func stopSkeletonAnimation() {
        skeletonIsAnimated = false
        subviewsSkeletonables.recursiveSearch(leafBlock: stopSkeletonLayerAnimationBlock) { subview in
            subview.stopSkeletonAnimation()
        }
    }
}

extension UIView {
    
    func showSkeleton(skeletonConfig config: SkeletonConfig) {
        skeletonIsAnimated = config.animated
        flowDelegate = SkeletonFlowHandler()
        flowDelegate?.willBeginShowingSkeletons(withRootView: self)
        recursiveShowSkeleton(skeletonConfig: config, root: self)
    }

    fileprivate func recursiveShowSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        layoutIfNeeded()

        currentSkeletonConfig = config

        addDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            showSkeletonIfNotActive(skeletonConfig: config)
        }){ subview in
            subview.recursiveShowSkeleton(skeletonConfig: config)
        }

        if let root = root {
            flowDelegate?.didShowSkeletons(withRootView: root)
        }
    }

    fileprivate func showSkeletonIfNotActive(skeletonConfig config: SkeletonConfig) {
        guard !self.isSkeletonActive else { return }
        self.isUserInteractionEnabled = false
        self.saveViewState()
        (self as? PrepareForSkeleton)?.prepareViewForSkeleton()
        self.addSkeletonLayer(skeletonConfig: config)
    }

    func updateSkeleton(skeletonConfig config: SkeletonConfig) {
        guard let flowDelegate = flowDelegate else { return }
        skeletonIsAnimated = config.animated
        flowDelegate.willBeginUpdatingSkeletons(withRootView: self)
        recursiveUpdateSkeleton(skeletonConfig: config, root: self)
    }

    fileprivate func recursiveUpdateSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        layoutIfNeeded()

        currentSkeletonConfig = config

        updateDummyDataSourceIfNeeded()
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            guard isSkeletonActive else { return }

            if skeletonLayer?.type != config.type {
                hideSkeleton()
            }

            if isSkeletonActive {
                updateSkeletonLayer(skeletonConfig: config)
            } else {
                showSkeletonIfNotActive(skeletonConfig: config)
            }
        }) { subview in
            subview.recursiveUpdateSkeleton(skeletonConfig: config)
        }

        if let root = root {
            flowDelegate?.didUpdateSkeletons(withRootView: root)
        }
    }

    fileprivate func recursiveLayoutSkeletonIfNeeded(root: UIView? = nil) {
        layoutIfNeeded()

        subviewsSkeletonables.recursiveSearch(leafBlock: {
            layoutSkeletonLayerIfNeeded()
        }) { subview in
            subview.recursiveLayoutSkeletonIfNeeded()
        }

        if let root = root {
            flowDelegate?.didLayoutSkeletonsIfNeeded(withRootView: root)
        }
    }

    fileprivate func recursiveHideSkeleton(reloadDataAfter reload: Bool, root: UIView? = nil) {
        removeDummyDataSourceIfNeeded(reloadAfter: reload)
        isUserInteractionEnabled = true
        subviewsSkeletonables.recursiveSearch(leafBlock: {
            recoverViewState(forced: false)
            removeSkeletonLayer()
        }) { subview in
            subview.recursiveHideSkeleton(reloadDataAfter: reload)
        }

        if let root = root {
            flowDelegate?.didHideSkeletons(withRootView: root)
        }
    }
    
    fileprivate func startSkeletonLayerAnimationBlock(_ anim: SkeletonLayerAnimation? = nil) -> VoidBlock {
        return {
            guard let layer = self.skeletonLayer else { return }
            layer.start(anim)
        }
    }
    
    fileprivate var stopSkeletonLayerAnimationBlock: VoidBlock {
        return {
            guard let layer = self.skeletonLayer else { return }
            layer.stopAnimation()
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
        layer.insertSublayer(skeletonLayer.contentLayer, at: UInt32.max)
        if config.animated { skeletonLayer.start(config.animation) }
        status = .on
    }
    
    func updateSkeletonLayer(skeletonConfig config: SkeletonConfig) {
        guard let skeletonLayer = skeletonLayer else { return }
        skeletonLayer.update(usingColors: config.colors)
        if config.animated { skeletonLayer.start(config.animation) }
        else { skeletonLayer.stopAnimation() }
    }

    func layoutSkeletonLayerIfNeeded() {
        guard let skeletonLayer = skeletonLayer else { return }
        skeletonLayer.layoutIfNeeded()
    }
    
    func removeSkeletonLayer() {
        guard isSkeletonActive,
            let skeletonLayer = skeletonLayer else { return }
        skeletonLayer.stopAnimation()
        skeletonLayer.removeLayer()
        self.skeletonLayer = nil
        status = .off
        currentSkeletonConfig = nil
    }
}


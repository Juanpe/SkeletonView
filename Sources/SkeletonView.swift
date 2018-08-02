//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public extension UIView {
    
    func showSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor) {
        showSkeleton(withType: .solid, usingColors: [color])
    }
    
    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors)
    }
    
    func showAnimatedSkeleton(usingColor color: UIColor = SkeletonAppearance.default.tintColor, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .solid, usingColors: [color], animated: true, animation: animation)
    }
    
    func showAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonAppearance.default.gradient, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors, animated: true, animation: animation)
    }
    
    func hideSkeleton(reloadDataAfter reload: Bool = true) {
        flowDelegate?.willBeginHidingSkeletons(withRootView: self)
        recursiveHideSkeleton(reloadDataAfter: reload)
    }
    
    func startSkeletonAnimation(_ anim: SkeletonLayerAnimation? = nil) {
        skeletonIsAnimated = true
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock:  startSkeletonLayerAnimationBlock(anim)) {
                            $0.startSkeletonAnimation(anim)
                        }
    }

    func stopSkeletonAnimation() {
        skeletonIsAnimated = false
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: stopSkeletonLayerAnimationBlock) {
                            $0.stopSkeletonAnimation()
        }
    }
}

extension UIView {
    
    func showSkeleton(withType type: SkeletonType = .solid, usingColors colors: [UIColor], animated: Bool = false, animation: SkeletonLayerAnimation? = nil) {
        skeletonIsAnimated = animated
        flowDelegate = SkeletonFlowHandler()
        flowDelegate?.willBeginShowingSkeletons(withRootView: self)
        recursiveShowSkeleton(withType: type, usingColors: colors, animated: animated, animation: animation)
    }
    
    fileprivate func recursiveShowSkeleton(withType type: SkeletonType, usingColors colors: [UIColor], animated: Bool, animation: SkeletonLayerAnimation?) {
        addDummyDataSourceIfNeeded()
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: {
                            guard !isSkeletonActive else { return }
                            isUserInteractionEnabled = false
                            saveViewState()
                            (self as? PrepareForSkeleton)?.prepareViewForSkeleton()
                            addSkeletonLayer(withType: type, usingColors: colors, animated: animated, animation: animation)
        }) {
            $0.recursiveShowSkeleton(withType: type, usingColors: colors, animated: animated, animation: animation)
        }
    }
    
    fileprivate func recursiveHideSkeleton(reloadDataAfter reload: Bool) {
        removeDummyDataSourceIfNeeded()
        isUserInteractionEnabled = true
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: {
                            recoverViewState(forced: false)
                            removeSkeletonLayer()
                        }, recursiveBlock: {
                            $0.recursiveHideSkeleton(reloadDataAfter: reload)
                        })
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
    
    func addSkeletonLayer(withType type: SkeletonType, usingColors colors: [UIColor], gradientDirection direction: GradientDirection? = nil, animated: Bool, animation: SkeletonLayerAnimation? = nil) {
        self.skeletonLayer = SkeletonLayerFactory().makeSkeletonLayer(withType: type, usingColors: colors, andHolder: self)
        layer.insertSublayer(skeletonLayer!.contentLayer, at: UInt32.max)
        if animated { skeletonLayer!.start(animation) }
        status = .on
    }
    
    func removeSkeletonLayer() {
        guard isSkeletonActive,
            let layer = skeletonLayer else { return }
        layer.stopAnimation()
        layer.removeLayer()
        skeletonLayer = nil
        status = .off
    }
}


//
//  SkeletonView.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

public extension NSView {
    
    func showSkeleton(usingColor color: NSColor = SkeletonDefaultConfig.tintColor) {
        showSkeleton(withType: .solid, usingColors: [color])
    }
    
    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonDefaultConfig.gradient) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors)
    }
    
    func showAnimatedSkeleton(usingColor color: NSColor = SkeletonDefaultConfig.tintColor, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .solid, usingColors: [color], animated: true, animation: animation)
    }
    
    func showAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonDefaultConfig.gradient, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors, animated: true, animation: animation)
    }
    
    func hideSkeleton(reloadDataAfter reload: Bool = true) {
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: { removeSkeletonLayer() },
                        recursiveBlock: {
                            $0.hideSkeleton(reloadDataAfter: reload)
                        })
    }
    
    func startSkeletonAnimation(_ anim: SkeletonLayerAnimation? = nil) {
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock:  startSkeletonLayerAnimationBlock(anim)) {
                            $0.startSkeletonAnimation(anim)
                        }
    }

    func stopSkeletonAnimation() {
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: stopSkeletonLayerAnimationBlock) {
                            $0.stopSkeletonAnimation()
        }
    }
}

extension NSView {
    
    func showSkeleton(withType type: SkeletonType = .solid, usingColors colors: [NSColor], animated: Bool = false, animation: SkeletonLayerAnimation? = nil) {
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: {
                            guard !isSkeletonActive else { return }
                            (self as? PrepareForSkeleton)?.prepareViewForSkeleton()
                            addSkeletonLayer(withType: type, usingColors: colors, animated: animated, animation: animation)
                        }) {
                            $0.showSkeleton(withType: type, usingColors: colors, animated: animated, animation: animation)
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

extension NSView {
    @objc var subviewsSkeletonables: [NSView] {
        return subviews.filter { $0.isSkeletonable }
    }
}

extension NSStackView {
    override var subviewsSkeletonables: [NSView] {
        return arrangedSubviews.filter { $0.isSkeletonable }
    }
}

extension NSView {
    
    func addSkeletonLayer(withType type: SkeletonType, usingColors colors: [NSColor], gradientDirection direction: GradientDirection? = nil, animated: Bool, animation: SkeletonLayerAnimation? = nil) {
        self.wantsLayer = true
        
        self.skeletonLayer = SkeletonLayerFactory().makeLayer(withType: type, usingColors: colors, andHolder: self)
        layer?.insertSublayer(skeletonLayer!.contentLayer, at: UInt32.max)
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


//
//  SkeletonView.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 01/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public extension UIView {

    func showSkeleton(usingColor color: UIColor = SkeletonDefaultConfig.tintColor) {
        showSkeleton(withType: .solid, usingColors: [color])
    }

    func showGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonDefaultConfig.gradient) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors)
    }

    func showAnimatedSkeleton(usingColor color: UIColor = SkeletonDefaultConfig.tintColor, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .solid, usingColors: [color], animated: true, animation: animation)
    }

    func showAnimatedGradientSkeleton(usingGradient gradient: SkeletonGradient = SkeletonDefaultConfig.gradient, animation: SkeletonLayerAnimation? = nil) {
        showSkeleton(withType: .gradient, usingColors: gradient.colors, animated: true, animation: animation)
    }

    func hideSkeleton(reloadDataAfter reload: Bool = true) {
        removeDummyDataSourceIfNeeded(reloadAfter: reload)
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: { removeSkeletonLayer() },
                        recursiveBlock: {
                            $0.hideSkeleton(reloadDataAfter: reload)
                        })
    }

    func startSkeletonAnimation(_ anim: SkeletonLayerAnimation? = nil) {
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: startSkeletonLayerAnimationBlock(anim)) {
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

extension UIView {

    func showSkeleton(withType type: SkeletonType = .solid, usingColors colors: [UIColor], animated: Bool = false, animation: SkeletonLayerAnimation? = nil) {
        addDummyDataSourceIfNeeded()
        recursiveSearch(inArray: subviewsSkeletonables,
                        leafBlock: {
                            if isSkeletonActive {
                                updateSkeletonLayer()
                            } else {
                                (self as? PrepareForSkeleton)?.prepareViewForSkeleton()
                                addSkeletonLayer(withType: type, usingColors: colors, animated: animated, animation: animation)
                            }
                        },
                        recursiveBlock: {
                            $0.showSkeleton(withType: type, usingColors: colors, animated: animated, animation: animation)
                        })
    }

    func startSkeletonLayerAnimationBlock(_ anim: SkeletonLayerAnimation? = nil) -> VoidBlock {
        return {
            guard let layer = self.skeletonLayer else { return }
            layer.start(anim)
        }
    }

    var stopSkeletonLayerAnimationBlock: VoidBlock {
        return {
            guard let layer = self.skeletonLayer else { return }
            layer.stopAnimation()
        }
    }
}

extension UIView {
    @objc var subviewsSkeletonables: [UIView] {
        return subviews.filter { $0.isSkeletonable }
    }
}

extension UITableView {
    override var subviewsSkeletonables: [UIView] {
        return visibleCells.filter { $0.isSkeletonable }
    }
}

public extension UITableViewCell {
    override var subviewsSkeletonables: [UIView] {
        return contentView.subviews.filter { $0.isSkeletonable }
    }
}

extension UIStackView {
    override var subviewsSkeletonables: [UIView] {
        return arrangedSubviews.filter { $0.isSkeletonable }
    }
}

extension UIView {

    func addSkeletonLayer(withType type: SkeletonType, usingColors colors: [UIColor], animated: Bool, animation: SkeletonLayerAnimation? = nil) {
        self.skeletonLayer = SkeletonLayerFactory.makeLayer(withType: type, usingColors: colors, andHolder: self)
        layer.insertSublayer(skeletonLayer!.contentLayer, at: UInt32.max)
        if animated { skeletonLayer!.start(animation) }
        status = .on
    }

    func updateSkeletonLayer() {
        guard let skLayer = skeletonLayer else { return }
        skLayer.updateLayer()
    }

    func removeSkeletonLayer() {
        guard isSkeletonActive, let layer = skeletonLayer else { return }
        layer.stopAnimation()
        layer.removeLayer()
        skeletonLayer = nil
        status = .off
    }
}

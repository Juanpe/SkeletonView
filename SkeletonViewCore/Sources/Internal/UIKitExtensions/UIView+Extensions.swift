//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+Extensions.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

extension SkeletonViewExtension where ExtendedType: UIView {
    
    var treeNode: SkeletonTreeNode<ExtendedType> {
        SkeletonTreeNode<ExtendedType>(self.type)
    }
    
}

extension UIView {

    /// Flags
    
    var isSuperviewAStackView: Bool {
        superview is UIStackView
    }
    
    var isRTL: Bool {
        if #available(iOS 10.0, *), #available(tvOS 10.0, *) {
            return effectiveUserInterfaceLayoutDirection == .rightToLeft
        } else {
            return false
        }
    }
    
    /// Math
    
    var definedMaxBounds: CGRect {
        if let parentStackView = (superview as? UIStackView) {
            var origin: CGPoint = .zero
            switch parentStackView.alignment {
            case .trailing:
                origin.x = definedMaxWidth
            default:
                break
            }
            return CGRect(origin: origin, size: definedMaxSize)
        }
        return CGRect(origin: .zero, size: definedMaxSize)
    }
    
    var definedMaxSize: CGSize {
        CGSize(width: definedMaxWidth, height: definedMaxHeight)
    }
    
    var definedMaxWidth: CGFloat {
        let constraintsMaxWidth = widthConstraints
            .map { $0.constant }
            .max() ?? 0

        return max(frame.size.width, constraintsMaxWidth)
    }
    
    var definedMaxHeight: CGFloat {
        let constraintsMaxHeight = heightConstraints
            .map { $0.constant }
            .max() ?? 0

        return max(frame.size.height, constraintsMaxHeight)
    }
    
    /// Autolayout
    
    var widthConstraints: [NSLayoutConstraint] {
        nonContentSizeLayoutConstraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.width }
    }
    
    var heightConstraints: [NSLayoutConstraint] {
        nonContentSizeLayoutConstraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.height }
    }
    
    var skeletonHeightConstraints: [NSLayoutConstraint] {
        nonContentSizeLayoutConstraints.filter {
            $0.firstAttribute == NSLayoutConstraint.Attribute.height
                && $0.identifier?.contains("SkeletonView.Constraint.Height") ?? false
        }
    }
    
    @discardableResult
    func setHeight(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        let heightConstraint = heightAnchor.constraint(equalToConstant: constant)
        heightConstraint.identifier = "SkeletonView.Constraint.Height.\(constant)"
        NSLayoutConstraint.activate([heightConstraint])
        return heightConstraint
    }
    
    var nonContentSizeLayoutConstraints: [NSLayoutConstraint] {
        constraints.filter({ "\(type(of: $0))" != "NSContentSizeLayoutConstraint" })
    }
    
    /// Animations
    
    func startSkeletonLayerAnimationBlock(_ anim: SkeletonLayerAnimation? = nil) -> VoidBlock {
        {
            self._isSkeletonAnimated = true
            guard let layer = self._skeletonLayer else { return }
            layer.start(anim) { [weak self] in
                self?._isSkeletonAnimated = false
            }
        }
    }
    
    var stopSkeletonLayerAnimationBlock: VoidBlock {
        {
            self._isSkeletonAnimated = false
            guard let layer = self._skeletonLayer else { return }
            layer.stopAnimation()
        }
    }
    
    /// Skeleton Layer
    
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
            
            // Workaround to fix the problem when inserting a sublayer and
            // the content offset is modified by the system.
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
        guard sk.isSkeletonActive,
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

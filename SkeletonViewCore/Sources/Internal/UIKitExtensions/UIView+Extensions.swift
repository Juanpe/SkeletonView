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

extension UIView {

    /// Flags
    
    var isSuperviewAStackView: Bool {
        superview is UIStackView
    }
    
    var isSkeletonActive: Bool {
        return _status == .on || subviewsSkeletonables.contains(where: { $0.isSkeletonActive })
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
    
    /// Skeleton flow
    
    func showSkeleton(skeletonConfig config: SkeletonConfig) {
        _isSkeletonAnimated = config.animated
        _flowDelegate = SkeletonFlowHandler()
        _flowDelegate?.willBeginShowingSkeletons(rootView: self)
        recursiveShowSkeleton(skeletonConfig: config, root: self)
    }

    func updateSkeleton(skeletonConfig config: SkeletonConfig) {
        _isSkeletonAnimated = config.animated
        _flowDelegate?.willBeginUpdatingSkeletons(rootView: self)
        recursiveUpdateSkeleton(skeletonConfig: config, root: self)
    }

    func recursiveLayoutSkeletonIfNeeded(root: UIView? = nil) {
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

    func recursiveHideSkeleton(reloadDataAfter reload: Bool, transition: SkeletonTransitionStyle, root: UIView? = nil) {
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
    
}

private extension UIView {
    
    func showSkeletonIfNotActive(skeletonConfig config: SkeletonConfig) {
        guard !isSkeletonActive else { return }
        saveViewState()

        prepareViewForSkeleton()
        addSkeletonLayer(skeletonConfig: config)
    }
    
    func recursiveShowSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
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
    
    func recursiveUpdateSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
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
    
}

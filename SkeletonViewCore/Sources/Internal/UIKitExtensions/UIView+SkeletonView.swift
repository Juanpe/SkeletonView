//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+SkeletonView.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

extension UIView {
    
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
            guard isSkeletonable, sk.isSkeletonActive else { return }
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
        guard sk.isSkeletonActive else { return }
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
        guard !sk.isSkeletonActive else { return }
        saveViewState()

        prepareViewForSkeleton()
        addSkeletonLayer(skeletonConfig: config)
    }
    
    func recursiveShowSkeleton(skeletonConfig config: SkeletonConfig, root: UIView? = nil) {
        if isHiddenWhenSkeletonIsActive {
            isHidden = true
        }
        guard isSkeletonable && !sk.isSkeletonActive else { return }
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
        guard sk.isSkeletonActive else { return }
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

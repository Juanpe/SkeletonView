//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+AssociatedObjects.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

// codebeat:disable[TOO_MANY_IVARS]
enum ViewAssociatedKeys {
    
    static var skeletonable = "skeletonable"
    static var hiddenWhenSkeletonIsActive = "hiddenWhenSkeletonIsActive"
    static var status = "status"
    static var skeletonLayer = "layer"
    static var flowDelegate = "flowDelegate"
    static var isSkeletonAnimated = "isSkeletonAnimated"
    static var viewState = "viewState"
    static var labelViewState = "labelViewState"
    static var imageViewState = "imageViewState"
    static var buttonViewState = "buttonViewState"
    static var headerFooterViewState = "headerFooterViewState"
    static var currentSkeletonConfig = "currentSkeletonConfig"
    static var skeletonCornerRadius = "skeletonCornerRadius"
    static var disabledWhenSkeletonIsActive = "disabledWhenSkeletonIsActive"
    static var delayedShowSkeletonWorkItem = "delayedShowSkeletonWorkItem"
    
}
// codebeat:enable[TOO_MANY_IVARS]

extension UIView {
    
    enum SkeletonStatus {
        case on
        case off
    }

    var _flowDelegate: SkeletonFlowDelegate? {
        get { return ao_get(pkey: &ViewAssociatedKeys.flowDelegate) as? SkeletonFlowDelegate }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.flowDelegate) }
    }

    var _skeletonLayer: SkeletonLayer? {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.skeletonLayer) }
    }

    var _currentSkeletonConfig: SkeletonConfig? {
        get { return ao_get(pkey: &ViewAssociatedKeys.currentSkeletonConfig) as? SkeletonConfig }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.currentSkeletonConfig) }
    }

    var _status: SkeletonStatus {
        get { return ao_get(pkey: &ViewAssociatedKeys.status) as? SkeletonStatus ?? .off }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.status) }
    }

    var _isSkeletonAnimated: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.isSkeletonAnimated) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.isSkeletonAnimated) }
    }
    
    var _delayedShowSkeletonWorkItem: DispatchWorkItem? {
        get { return ao_get(pkey: &ViewAssociatedKeys.delayedShowSkeletonWorkItem) as? DispatchWorkItem }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.delayedShowSkeletonWorkItem) }
    }
    
    var _skeletonable: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonable) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.skeletonable) }
    }
    
    var _hiddenWhenSkeletonIsActive: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.hiddenWhenSkeletonIsActive) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.hiddenWhenSkeletonIsActive) }
    }
    
    var _disabledWhenSkeletonIsActive: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.disabledWhenSkeletonIsActive) as? Bool ?? true }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.disabledWhenSkeletonIsActive) }
    }

    var _skeletonableCornerRadius: Float {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonCornerRadius) as? Float ?? SkeletonViewAppearance.shared.skeletonCornerRadius }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.skeletonCornerRadius) }
    }
}

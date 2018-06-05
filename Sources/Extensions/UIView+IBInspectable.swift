//
//  UIView+IBInspectable.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 01/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

private enum AssociatedKeys {
    static var skeletonable = "skeletonable"
    static var status = "status"
    static var skeletonLayer = "layer"
    static var flowDelegate = "flowDelegate"
    static var isSkeletonAnimated = "isSkeletonAnimated"
    static var viewState = "viewState"
}

public extension UIView {
    
    @IBInspectable
    var isSkeletonable: Bool {
        get { return skeletonable }
        set { skeletonable = newValue }
    }
    
    var isSkeletonActive: Bool {
        return status == .on || (subviewsSkeletonables.first(where: { $0.isSkeletonActive }) != nil)
    }
}

extension UIView {
    
    enum Status {
        case on
        case off
    }
    
    var flowDelegate: SkeletonFlowDelegate? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.flowDelegate) as? SkeletonFlowDelegate }
        set { objc_setAssociatedObject(self, &AssociatedKeys.flowDelegate, newValue, AssociationPolicy.retain.objc) }
    }
    
    var skeletonLayer: SkeletonLayer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonLayer, newValue, AssociationPolicy.retain.objc) }
    }
    
    var status: Status! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.status) as? Status ?? .off }
        set { objc_setAssociatedObject(self, &AssociatedKeys.status, newValue, AssociationPolicy.retain.objc) }
    }
    
    var viewState: RecoverableViewState? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.viewState) as? RecoverableViewState }
        set { objc_setAssociatedObject(self, &AssociatedKeys.viewState, newValue, AssociationPolicy.retain.objc) }
    }
    
    var skeletonIsAnimated: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.isSkeletonAnimated) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.isSkeletonAnimated, newValue, AssociationPolicy.retain.objc) }
    }

    fileprivate var skeletonable: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonable) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonable, newValue, AssociationPolicy.retain.objc) }
    }
}


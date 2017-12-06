//
//  NSView+IBInspectable.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

private enum AssociatedKeys {
    static var skeletonable = "skeletonable"
    static var status = "status"
    static var skeletonLayer = "layer"
}

public extension NSView {
    
    @IBInspectable
    var isSkeletonable: Bool {
        get { return skeletonable }
        set { skeletonable = newValue }
    }
    
    var isSkeletonActive: Bool {
        return status == .on || (subviewsSkeletonables.first(where: { $0.isSkeletonActive }) != nil)
    }
}

extension NSView {
    
    enum Status {
        case on
        case off
    }
    
    var skeletonLayer: SkeletonLayer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonLayer, newValue, AssociationPolicy.retain.objc) }
    }
    
    var status: Status! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.status) as? Status ?? .off }
        set { objc_setAssociatedObject(self, &AssociatedKeys.status, newValue, AssociationPolicy.retain.objc) }
    }

    fileprivate var skeletonable: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonable) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonable, newValue, AssociationPolicy.retain.objc) }
    }
}


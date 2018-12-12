// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

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

    var skeletonIsAnimated: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.isSkeletonAnimated) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.isSkeletonAnimated, newValue, AssociationPolicy.retain.objc) }
    }
}

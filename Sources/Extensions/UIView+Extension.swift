// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

extension UIView {

    enum Status {
        case on
        case off
    }

    var flowDelegate: SkeletonFlowDelegate? {
        get { return objc_getAssociatedObject(self, &ViewAssociatedKeys.flowDelegate) as? SkeletonFlowDelegate }
        set { objc_setAssociatedObject(self, &ViewAssociatedKeys.flowDelegate, newValue, AssociationPolicy.retain.objc) }
    }

    var skeletonLayer: SkeletonLayer? {
        get { return objc_getAssociatedObject(self, &ViewAssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { objc_setAssociatedObject(self, &ViewAssociatedKeys.skeletonLayer, newValue, AssociationPolicy.retain.objc) }
    }

    var status: Status! {
        get { return objc_getAssociatedObject(self, &ViewAssociatedKeys.status) as? Status ?? .off }
        set { objc_setAssociatedObject(self, &ViewAssociatedKeys.status, newValue, AssociationPolicy.retain.objc) }
    }

    var skeletonIsAnimated: Bool! {
        get { return objc_getAssociatedObject(self, &ViewAssociatedKeys.isSkeletonAnimated) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &ViewAssociatedKeys.isSkeletonAnimated, newValue, AssociationPolicy.retain.objc) }
    }
}

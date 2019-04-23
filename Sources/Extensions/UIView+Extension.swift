// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

// codebeat:disable[TOO_MANY_IVARS]
enum ViewAssociatedKeys {
    static var skeletonable = "skeletonable"
    static var status = "status"
    static var skeletonLayer = "layer"
    static var flowDelegate = "flowDelegate"
    static var isSkeletonAnimated = "isSkeletonAnimated"
    static var viewState = "viewState"
}
// codebeat:enable[TOO_MANY_IVARS]

extension UIView {

    enum Status {
        case on
        case off
    }

    var flowDelegate: SkeletonFlowDelegate? {
        get { return ao_get(pkey: &ViewAssociatedKeys.flowDelegate) as? SkeletonFlowDelegate }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.flowDelegate) }
    }

    var skeletonLayer: SkeletonLayer? {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.skeletonLayer) }
    }

    var status: Status! {
        get { return ao_get(pkey: &ViewAssociatedKeys.status) as? Status ?? .off }
        set { ao_set(newValue ?? .off, pkey: &ViewAssociatedKeys.status) }
    }

    var skeletonIsAnimated: Bool! {
        get { return ao_get(pkey: &ViewAssociatedKeys.isSkeletonAnimated) as? Bool ?? false }
        set { ao_set(newValue ?? false, pkey: &ViewAssociatedKeys.isSkeletonAnimated) }
    }
}

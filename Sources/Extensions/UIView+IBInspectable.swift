//  Copyright © 2017 SkeletonView. All rights reserved.
import UIKit

public extension UIView {
    
    @IBInspectable
    var isSkeletonable: Bool {
        get { return skeletonable }
        set { skeletonable = newValue }
    }
    
    var isSkeletonActive: Bool {
        return status == .on || (subviewsSkeletonables.first(where: { $0.isSkeletonActive }) != nil)
    }

    fileprivate var skeletonable: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonable) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonable, newValue, AssociationPolicy.retain.objc) }
    }
}


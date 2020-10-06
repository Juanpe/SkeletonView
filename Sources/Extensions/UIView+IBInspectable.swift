//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public extension UIView {
    @IBInspectable
    var isSkeletonable: Bool {
        get { return skeletonable }
        set { skeletonable = newValue }
    }
    
    @IBInspectable
    var isHiddenWhenSkeletonIsActive: Bool {
        get { return hiddenWhenSkeletonIsActive }
        set { hiddenWhenSkeletonIsActive = newValue }
    }

    @IBInspectable
    var skeletonCornerRadius: Float {
        get { return skeletonableCornerRadius }
        set { skeletonableCornerRadius = newValue }
    }
    
    var isSkeletonActive: Bool {
        return status == .on || subviewsSkeletonables.contains(where: { $0.isSkeletonActive })
    }

    private var skeletonable: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonable) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.skeletonable) }
    }
    
    private var hiddenWhenSkeletonIsActive: Bool {
        get { return ao_get(pkey: &ViewAssociatedKeys.hiddenWhenSkeletonIsActive) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.hiddenWhenSkeletonIsActive) }
    }

    private var skeletonableCornerRadius: Float {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonCornerRadius) as? Float ?? 0.0 }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.skeletonCornerRadius) }
    }
}

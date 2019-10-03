// Copyright © 2019 SkeletonView. All rights reserved.

import Foundation
import UIKit

public extension UITextView {
    @IBInspectable
    var singlelineFillPercent: Int {
        get { return singlelineFillingPercent }
        set { singlelineFillingPercent = min(newValue, 100) }
    }
    @IBInspectable
    var lineCornerRadius: Int {
        get { return singlelineCornerRadius }
        set { singlelineCornerRadius = min(newValue, 10) }
    }
}

extension UITextView: ContainsSinglelineText {
    
    var singlelineFillingPercent: Int {
        get { return ao_get(pkey: &SinglelineAssociatedKeys.singlelineFillingPercent) as? Int ?? SkeletonAppearance.default.singlelineFillPercent }
        set { ao_set(newValue, pkey: &SinglelineAssociatedKeys.singlelineFillingPercent) }
    }

    var singlelineCornerRadius: Int {
        get { return ao_get(pkey: &SinglelineAssociatedKeys.singlelineCornerRadius) as? Int ?? SkeletonAppearance.default.singlelineCornerRadius }
        set { ao_set(newValue, pkey: &SinglelineAssociatedKeys.singlelineCornerRadius) }
    }
}

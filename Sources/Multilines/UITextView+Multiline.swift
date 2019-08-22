// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

public extension UITextView {
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }

    @IBInspectable
    var linesCornerRadius: Int {
        get { return multilineCornerRadius }
        set { multilineCornerRadius = min(newValue, 10) }
    }
}

extension UITextView: ContainsMultilineText {
    var lastLineFillingPercent: Int {
        get {
            let defaultValue = SkeletonAppearance.default.multilineLastLineFillPercent
            return ao_get(pkey: &MultilineAssociatedKeys.lastLineFillingPercent) as? Int ?? defaultValue
        }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.lastLineFillingPercent) }
    }

    var multilineCornerRadius: Int {
        get {
            let defaultValue = SkeletonAppearance.default.multilineCornerRadius
            return ao_get(pkey: &MultilineAssociatedKeys.multilineCornerRadius) as? Int ?? defaultValue
        }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.multilineCornerRadius) }
    }
}

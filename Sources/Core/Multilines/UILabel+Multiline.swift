// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

public extension UILabel {
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

extension UILabel: ContainsMultilineText {
    var numLines: Int {
        return numberOfLines
    }

    var lastLineFillingPercent: Int {
        get { return ao_get(pkey: &MultilineAssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonAppearance.default.multilineLastLineFillPercent }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.lastLineFillingPercent) }
    }

    var multilineCornerRadius: Int {
        get { return ao_get(pkey: &MultilineAssociatedKeys.multilineCornerRadius) as? Int ?? SkeletonAppearance.default.multilineCornerRadius }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.multilineCornerRadius) }
    }
}

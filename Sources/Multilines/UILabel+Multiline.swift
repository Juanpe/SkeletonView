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
    
    @IBInspectable
    var skeletonLineSpacing: CGFloat {
        get { return multilineSpacing }
        set { multilineSpacing = min(newValue, 10) }
    }
    
    var skeletonPaddingInsets: UIEdgeInsets {
        get { return paddingInsets }
        set { paddingInsets = newValue }
    }
}

extension UILabel: ContainsMultilineText {
	var multilineTextFont: UIFont? {
		return font
	}
	
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

    var multilineSpacing: CGFloat {
        get { return ao_get(pkey: &MultilineAssociatedKeys.multilineSpacing) as? CGFloat ?? SkeletonAppearance.default.multilineSpacing }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.multilineSpacing) }
    }

    var paddingInsets: UIEdgeInsets {
        get { return ao_get(pkey: &MultilineAssociatedKeys.paddingInsets) as? UIEdgeInsets ?? .zero }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.paddingInsets) }
    }
    
    var backupHeightConstraints: [NSLayoutConstraint] {
        get { return ao_get(pkey: &MultilineAssociatedKeys.backupHeightConstraints) as? [NSLayoutConstraint] ?? [] }
        set { ao_set(newValue, pkey: &MultilineAssociatedKeys.backupHeightConstraints) }
    }
}

//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

enum MultilineAssociatedKeys {
    static var lastLineFillingPercent = "lastLineFillingPercent"
    static var multilineCornerRadius = "multilineCornerRadius"
    static var multilineSpacing = "multilineSpacing"
    static var paddingInsets = "paddingInsets"
}

protocol ContainsMultilineText {
	var multilineTextFont: UIFont? { get }
    var numLines: Int { get }
    var lastLineFillingPercent: Int { get }
    var multilineCornerRadius: Int { get }
    var multilineSpacing: CGFloat { get }
    var paddingInsets: UIEdgeInsets { get }
}

extension ContainsMultilineText {
    var numLines: Int { return 0 }
}

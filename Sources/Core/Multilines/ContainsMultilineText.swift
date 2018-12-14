//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

enum MultilineAssociatedKeys {
    static var lastLineFillingPercent = "lastLineFillingPercent"
    static var multilineCornerRadius = "multilineCornerRadius"
}

protocol ContainsMultilineText {
    var numLines: Int { get }
    var lastLineFillingPercent: Int { get }
    var multilineCornerRadius: Int { get }
}

extension ContainsMultilineText {
    var numLines: Int { return 0 }
}

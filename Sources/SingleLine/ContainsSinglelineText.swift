// Copyright © 2019 SkeletonView. All rights reserved.

import Foundation

enum SinglelineAssociatedKeys {
    static var singlelineFillingPercent = "singlelineFillingPercent"
    static var singlelineCornerRadius = "singlelineCornerRadius"
}

protocol ContainsSinglelineText {
    var singlelineFillingPercent: Int { get }
    var singlelineCornerRadius: Int { get }
}


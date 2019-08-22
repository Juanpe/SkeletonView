// Copyright © 2018 SkeletonView. All rights reserved.

import Foundation

extension Int {
    var whitespace: String {
        return whitespaces
    }
    
    var whitespaces: String {
        return String(repeating: " ", count: self)
    }
}

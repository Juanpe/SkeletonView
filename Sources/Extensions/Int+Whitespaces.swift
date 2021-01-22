// Copyright © 2018 SkeletonView. All rights reserved.

import Foundation

extension Int {
    var whitespace: String {
        whitespaces
    }
    
    var whitespaces: String {
        String(repeating: " ", count: self)
    }
}

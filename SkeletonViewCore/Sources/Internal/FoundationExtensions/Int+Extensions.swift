//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  Int+Extensions.swift
//

import Foundation

extension Int {
    
    var whitespace: String {
        whitespaces
    }
    
    var whitespaces: String {
        String(repeating: " ", count: self)
    }
    
}

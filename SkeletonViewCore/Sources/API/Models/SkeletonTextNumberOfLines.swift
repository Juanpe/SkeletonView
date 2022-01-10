//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonTextNumberOfLines.swift
//
//  Created by Juanpe Catalán on 10/1/22.

import UIKit

public enum SkeletonTextNumberOfLines: Equatable, ExpressibleByIntegerLiteral {
    
    /// Returns `numberOfLines` value.
    case inherited
    
    /// Returns the specific number of lines specified as the associated value.
    case custom(Int)
    
}

public extension SkeletonTextNumberOfLines {
    
    init(integerLiteral value: Int) {
        self = .custom(value)
    }
    
}

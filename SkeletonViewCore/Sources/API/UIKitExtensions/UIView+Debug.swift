//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+Debug.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

public extension UIView {
    
    /// Returns a string that describes the hierarchy of the skeleton, indicating
    /// whether the receiver is skeletonable and all skeletonable children.
    var skeletonDescription: String {
        var description = "<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())"
        let subSkeletons = subviewsSkeletonables
        
        if !subSkeletons.isEmpty {
            description += " | (\(subSkeletons.count)) subSkeletons"
        }
        
        if isSkeletonable {
            description += " | ☠️ "
        }
        
        return description + ">"
    }
    
}

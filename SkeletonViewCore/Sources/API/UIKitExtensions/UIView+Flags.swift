//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+Flags.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

public extension UIView {
    
    var isSkeletonActive: Bool {
        return _status == .on || subviewsSkeletonables.contains(where: { $0.isSkeletonActive })
    }
    
}

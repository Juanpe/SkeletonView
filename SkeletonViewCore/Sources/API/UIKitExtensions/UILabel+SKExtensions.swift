//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UILabel+SKExtensions.swift
//
//  Created by Juanpe Catalán on 23/8/21.

import UIKit

public extension UILabel {
    
    var skeletonPaddingInsets: UIEdgeInsets {
        get { return paddingInsets }
        set { paddingInsets = newValue }
    }
    
}

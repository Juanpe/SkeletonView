//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UITextView+SKExtensions.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

public extension UITextView {

    var skeletonPaddingInsets: UIEdgeInsets {
        get { return paddingInsets }
        set { paddingInsets = newValue }
    }
    
}

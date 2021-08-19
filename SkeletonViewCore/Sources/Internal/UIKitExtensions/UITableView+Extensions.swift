//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UITableView+Extensions.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

extension UITableView {
    
    var indexesOfVisibleSections: [Int] {
        (0..<numberOfSections).reduce([]) {
            let headerRect = style == .plain ? rect(forSection: $1) : rectForHeader(inSection: $1)
            
            let visiblePartOfTableView = CGRect(
                x: contentOffset.x,
                y: contentOffset.y,
                width: bounds.size.width,
                height: bounds.size.height
            )
            
            if visiblePartOfTableView.intersects(headerRect) {
                return $0 + [$1]
            }
            
            return $0
        }
    }

    var visibleSectionHeaders: [UITableViewHeaderFooterView] {
        indexesOfVisibleSections.compactMap { headerView(forSection: $0) }
    }
    
    var visibleSectionFooters: [UITableViewHeaderFooterView] {
        indexesOfVisibleSections.compactMap { footerView(forSection: $0) }
    }
    
}

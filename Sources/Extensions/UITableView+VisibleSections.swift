// Copyright © 2020 SkeletonView. All rights reserved.

import UIKit

extension UITableView {
    var indexesOfVisibleSections: [Int] {
        (0..<numberOfSections).reduce([]) {
            let headerRect: CGRect?
            
            if self.style == .plain {
                headerRect = rect(forSection: $1)
            } else {
                headerRect = rectForHeader(inSection: $1)
            }
            
            if let headerRect = headerRect {
                let visiblePartOfTableView = CGRect(x: contentOffset.x,
                                                    y: contentOffset.y,
                                                    width: bounds.size.width,
                                                    height: bounds.size.height)
                
                if visiblePartOfTableView.intersects(headerRect) {
                    return $0 + [$1]
                }
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

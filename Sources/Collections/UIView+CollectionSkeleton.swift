//
//  UIView+CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    func addDummyDataSourceIfNeeded() {
        guard let collection = self as? CollectionSkeleton else { return }
        collection.addDummyDataSource()
        collection.disableScrolling()
    }
    
    func removeDummyDataSourceIfNeeded(reloadAfter reload: Bool = true) {
        guard let collection = self as? CollectionSkeleton else { return }
        collection.removeDummyDataSource(reloadAfter: reload)
        collection.enableScrolling()
    }
}

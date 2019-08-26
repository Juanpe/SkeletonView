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
        status = .on
        collection.addDummyDataSource()
        collection.disableUserInteraction()
    }
    
    func updateDummyDataSourceIfNeeded() {
        guard let collection = self as? CollectionSkeleton else { return }
        collection.updateDummyDataSource()
    }
    
    func removeDummyDataSourceIfNeeded(reloadAfter reload: Bool = true) {
        guard let collection = self as? CollectionSkeleton else { return }
        status = .off
        collection.removeDummyDataSource(reloadAfter: reload)
        collection.enableUserInteraction()
    }
}

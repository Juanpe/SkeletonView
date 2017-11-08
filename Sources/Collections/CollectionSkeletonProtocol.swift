//
//  CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
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

protocol CollectionSkeleton {
    var skeletonDataSource: SkeletonCollectionDataSource? { get set }
    func addDummyDataSource()
    func removeDummyDataSource(reloadAfter: Bool)
    func disableScrolling()
    func enableScrolling()
}

private enum AssociatedKeys {
    static var dummyDataSource = "dummyDataSource"
}

extension CollectionSkeleton where Self: UIScrollView {
    
    func addDummyDataSource() {}
    func removeDummyDataSource(reloadAfter: Bool) {}
    func disableScrolling() { isScrollEnabled = false }
    func enableScrolling() { isScrollEnabled = true }
}

extension UITableView: CollectionSkeleton {
    
    var skeletonDataSource: SkeletonCollectionDataSource? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.dummyDataSource) as? SkeletonCollectionDataSource }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.dummyDataSource, newValue, AssociationPolicy.retain.objc)
            self.dataSource = newValue
        }
    }
    
    func addDummyDataSource() {
        guard let originalDataSource = self.dataSource as? SkeletonTableViewDataSource,
              !(originalDataSource is SkeletonCollectionDataSource)
            else { return }
        let dataSource = SkeletonCollectionDataSource(tableViewDataSource: originalDataSource)
        self.skeletonDataSource = dataSource
        reloadData()
    }
    
    func removeDummyDataSource(reloadAfter: Bool) {
        guard let dataSource = self.dataSource as? SkeletonCollectionDataSource else { return }
        self.skeletonDataSource = nil
        self.dataSource = dataSource.originalTableViewDataSource
        if reloadAfter { self.reloadData() }
    }
}

extension UICollectionView: CollectionSkeleton {
    
    var skeletonDataSource: SkeletonCollectionDataSource? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.dummyDataSource) as? SkeletonCollectionDataSource }
        set { objc_setAssociatedObject(self, &AssociatedKeys.dummyDataSource, newValue, AssociationPolicy.retain.objc) }
    }
}

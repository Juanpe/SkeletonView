//
//  UICollectionView+CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UICollectionView: CollectionSkeleton {
    
    var estimatedNumberOfRows: Int {
        guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else { return 0 }
        return Int(ceil(frame.height/flowlayout.itemSize.height))
    }
    
    var skeletonDataSource: SkeletonCollectionDataSource? {
        get { return objc_getAssociatedObject(self, &CollectionAssociatedKeys.dummyDataSource) as? SkeletonCollectionDataSource }
        set {
            objc_setAssociatedObject(self, &CollectionAssociatedKeys.dummyDataSource, newValue, AssociationPolicy.retain.objc)
            self.dataSource = newValue
        }
    }
    
    var skeletonDelegate: SkeletonCollectionDelegate? {
        get { return objc_getAssociatedObject(self, &CollectionAssociatedKeys.dummyDelegate) as? SkeletonCollectionDelegate }
        set {
            objc_setAssociatedObject(self, &CollectionAssociatedKeys.dummyDelegate, newValue, AssociationPolicy.retain.objc)
            self.delegate = newValue
        }
    }
    
    func addDummyDataSource() {
        guard let originalDataSource = self.dataSource as? SkeletonCollectionViewDataSource,
            !(originalDataSource is SkeletonCollectionDataSource)
            else { return }
        
        let dataSource = SkeletonCollectionDataSource(collectionViewDataSource: originalDataSource)
        self.skeletonDataSource = dataSource
        reloadData()
    }
    
    func removeDummyDataSource(reloadAfter: Bool) {
        guard let dataSource = self.dataSource as? SkeletonCollectionDataSource else { return }
        self.skeletonDataSource = nil
        self.dataSource = dataSource.originalCollectionViewDataSource
        if reloadAfter { self.reloadData() }
    }
}

extension UICollectionView: GenericCollectionView {
    var scrollView: UIScrollView { return self }
}

public extension UICollectionView {
    func prepareSkeleton(completion: @escaping (Bool) -> Void) {
        guard let originalDataSource = self.dataSource as? SkeletonCollectionViewDataSource,
            !(originalDataSource is SkeletonCollectionDataSource)
            else { return }
        
        let dataSource = SkeletonCollectionDataSource(collectionViewDataSource: originalDataSource, rowHeight: 0.0)
        self.skeletonDataSource = dataSource
        performBatchUpdates({
            self.reloadData()
        }) { (done) in
            completion(done)
            
        }
    }
}

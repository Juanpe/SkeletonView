//
//  RxCollectionViewSkeletonedReloadDataSource.swift
//  RxSkeleton
//
//  Created by Archer on 2018/11/30.
//

import SkeletonView
import RxDataSources

public class RxCollectionViewSkeletonedReloadDataSource<S: SectionModelType>
    : RxCollectionViewSectionedReloadDataSource<S>
    , SkeletonCollectionViewDataSource {

    public typealias NumberOfSections = (RxCollectionViewSkeletonedReloadDataSource<S>, UICollectionView) -> Int
    public typealias NumberOfItemsInSection = (RxCollectionViewSkeletonedReloadDataSource<S>, UICollectionView, Int) -> Int
    public typealias ReuseIdentifierForItemAtIndexPath = (RxCollectionViewSkeletonedReloadDataSource<S>, UICollectionView, IndexPath) -> String
    
    var numberOfSections: NumberOfSections
    var numberOfItemsInSection: NumberOfItemsInSection
    var reuseIdentifierForItemAtIndexPath: ReuseIdentifierForItemAtIndexPath
    
    public init(configureCell: @escaping ConfigureCell,
                configureSupplementaryView: ConfigureSupplementaryView? = nil,
                moveItem: @escaping MoveItem = { _, _, _ in () },
                canMoveItemAtIndexPath: @escaping CanMoveItemAtIndexPath = { _, _ in false },
                numberOfSections: @escaping NumberOfSections = { _, _ in 1 },
                numberOfItemsInSection: @escaping NumberOfItemsInSection = { _, cv, _ in
        guard let flowlayout = cv.collectionViewLayout as? UICollectionViewFlowLayout else { return 0 }
        return Int(ceil(cv.frame.height/flowlayout.itemSize.height))
        },
                reuseIdentifierForItemAtIndexPath: @escaping ReuseIdentifierForItemAtIndexPath) {
        self.numberOfSections = numberOfSections
        self.numberOfItemsInSection = numberOfItemsInSection
        self.reuseIdentifierForItemAtIndexPath = reuseIdentifierForItemAtIndexPath
        super.init(configureCell: configureCell,
                   configureSupplementaryView: configureSupplementaryView,
                   moveItem: moveItem, canMoveItemAtIndexPath: canMoveItemAtIndexPath)
    }
    
    public func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return numberOfSections(self, collectionSkeletonView)
    }
    
    public func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(self, skeletonView, section)
    }
    
    public func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> String {
        return reuseIdentifierForItemAtIndexPath(self, skeletonView, indexPath)
    }
}

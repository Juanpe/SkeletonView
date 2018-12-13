//
//  RxCollectionViewSkeletonedAnimatedDataSource.swift
//  RxSkeleton
//
//  Created by Archer on 2018/12/1.
//

import SkeletonView
import RxDataSources

/*
 This is commented becuse collection view has bugs when doing animated updates.
 Take a look at randomized sections.
 */
public class RxCollectionViewSkeletonedAnimatedDataSource<S: AnimatableSectionModelType>
    : RxCollectionViewSectionedAnimatedDataSource<S>
    , SkeletonCollectionViewDataSource {
    
    public typealias NumberOfSections = (RxCollectionViewSkeletonedAnimatedDataSource<S>, UICollectionView) -> Int
    public typealias NumberOfItemsInSection = (RxCollectionViewSkeletonedAnimatedDataSource<S>, UICollectionView, Int) -> Int
    public typealias ReuseIdentifierForItemAtIndexPath = (RxCollectionViewSkeletonedAnimatedDataSource<S>, UICollectionView, IndexPath) -> String
    
    var numberOfSections: NumberOfSections
    var numberOfItemsInSection: NumberOfItemsInSection
    var reuseIdentifierForItemAtIndexPath: ReuseIdentifierForItemAtIndexPath
    
    public init(animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
                decideViewTransition: @escaping DecideViewTransition = { _, _, _ in .animated },
                configureCell: @escaping ConfigureCell,
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
        super.init(animationConfiguration: animationConfiguration,
                   decideViewTransition: decideViewTransition,
                   configureCell: configureCell,
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

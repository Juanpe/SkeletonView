//
//  SkeletonUICollectionViewDataSource.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit


public protocol SkeletonUICollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdenfierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
}

public extension SkeletonUICollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skeletonView.estimatedNumberOfRows
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int { return 1 }
}


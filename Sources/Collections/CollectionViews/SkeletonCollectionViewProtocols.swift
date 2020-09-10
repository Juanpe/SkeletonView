//
//  SkeletonCollectionViewProtocols.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewIdentifierOfKind: String, at indexPath: IndexPath) -> ReusableCellIdentifier?
}

public extension SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skeletonView.estimatedNumberOfRows
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                supplementaryViewIdentifierOfKind: String,
                                at indexPath: IndexPath) -> ReusableCellIdentifier? {
        return nil
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int { return 1 }
}

public protocol SkeletonCollectionViewDelegate: UICollectionViewDelegate { }

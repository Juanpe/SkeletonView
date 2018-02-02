//
//  UICollectionView+CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UICollectionView: CollectionSkeleton {
    
    var skeletonDataSource: SkeletonCollectionDataSource? {
        get { return objc_getAssociatedObject(self, &DataSourceAssociatedKeys.dummyDataSource) as? SkeletonCollectionDataSource }
        set { objc_setAssociatedObject(self, &DataSourceAssociatedKeys.dummyDataSource, newValue, AssociationPolicy.retain.objc) }
    }
}

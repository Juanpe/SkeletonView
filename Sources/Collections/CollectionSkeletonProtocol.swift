//
//  CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

enum DataSourceAssociatedKeys {
    static var dummyDataSource = "dummyDataSource"
}

protocol CollectionSkeleton {
    var skeletonDataSource: SkeletonCollectionDataSource? { get set }
    var estimatedNumberOfRows: Int { get }
    
    func addDummyDataSource()
    func removeDummyDataSource(reloadAfter: Bool)
    func disableScrolling()
    func enableScrolling()
}

extension CollectionSkeleton where Self: UIScrollView {
    var estimatedNumberOfRows: Int { return 0 }
    func addDummyDataSource() {}
    func removeDummyDataSource(reloadAfter: Bool) {}
    func disableScrolling() { isScrollEnabled = false }
    func enableScrolling() { isScrollEnabled = true }
    
}

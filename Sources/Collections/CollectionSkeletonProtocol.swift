//
//  CollectionSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

enum CollectionAssociatedKeys {
    static var dummyDataSource = "dummyDataSource"
    static var dummyDelegate = "dummyDelegate"
}

protocol CollectionSkeleton {
    var skeletonDataSource: SkeletonCollectionDataSource? { get set }
    var skeletonDelegate: SkeletonCollectionDelegate? { get set }
    var estimatedNumberOfRows: Int { get }
    
    func addDummyDataSource()
    func removeDummyDataSource(reloadAfter: Bool)
    func disableUserInteraction()
    func enableUserInteraction()
}

extension CollectionSkeleton where Self: UIScrollView {
    var estimatedNumberOfRows: Int { return 0 }
    func addDummyDataSource() {}
    func removeDummyDataSource(reloadAfter: Bool) {}
    func disableUserInteraction() { isScrollEnabled = false }
    func enableUserInteraction() { isScrollEnabled = true }
}

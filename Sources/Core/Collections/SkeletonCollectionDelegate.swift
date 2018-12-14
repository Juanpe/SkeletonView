//
//  SkeletonCollectionDelegate.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 30/03/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

class SkeletonCollectionDelegate: NSObject {
    
    weak var originalTableViewDelegate: SkeletonTableViewDelegate?
    weak var originalCollectionViewDelegate: SkeletonCollectionViewDelegate?
    
    init(tableViewDelegate: SkeletonTableViewDelegate? = nil, collectionViewDelegate: SkeletonCollectionViewDelegate? = nil) {
        self.originalTableViewDelegate = tableViewDelegate
        self.originalCollectionViewDelegate = collectionViewDelegate
    }
}

// MARK: - UITableViewDataSource
extension SkeletonCollectionDelegate: UITableViewDelegate { }

// MARK: - UICollectionViewDataSource
extension SkeletonCollectionDelegate: UICollectionViewDelegate { }

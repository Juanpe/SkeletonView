//
//  SkeletonCollectionDataSource.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public typealias ReusableCellIdentifier = String

public class SkeletonCollectionDataSource: NSObject {

    weak var originalTableViewDataSource: SkeletonTableViewDataSource?
    weak var originalCollectionViewDataSource: UICollectionViewDataSource?

    public convenience init(tableViewDataSource: SkeletonTableViewDataSource? = nil, collectionViewDataSource: UICollectionViewDataSource? = nil) {
        self.init()
        self.originalTableViewDataSource = tableViewDataSource
        self.originalCollectionViewDataSource = collectionViewDataSource
    }
}

// MARK: - UITableViewDataSource
extension SkeletonCollectionDataSource: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return originalTableViewDataSource?.numSections(in: tableView) ?? 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, numberOfRowsInSection: section) ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = originalTableViewDataSource?.collectionSkeletonView(tableView, cellIdentifierForRowAt: indexPath) ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension SkeletonCollectionDataSource: UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

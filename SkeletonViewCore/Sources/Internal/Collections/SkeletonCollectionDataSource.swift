//
//  SkeletonCollectionDataSource.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public typealias ReusableCellIdentifier = String

class SkeletonCollectionDataSource: NSObject {
    weak var originalTableViewDataSource: SkeletonTableViewDataSource?
    weak var originalCollectionViewDataSource: SkeletonCollectionViewDataSource?
    var rowHeight: CGFloat = 0.0
    var originalRowHeight: CGFloat = 0.0
    
    convenience init(tableViewDataSource: SkeletonTableViewDataSource? = nil, collectionViewDataSource: SkeletonCollectionViewDataSource? = nil, rowHeight: CGFloat = 0.0, originalRowHeight: CGFloat = 0.0) {
        self.init()
        self.originalTableViewDataSource = tableViewDataSource
        self.originalCollectionViewDataSource = collectionViewDataSource
        self.rowHeight = rowHeight
        self.originalRowHeight = originalRowHeight
    }
}

// MARK: - UITableViewDataSource
extension SkeletonCollectionDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        originalTableViewDataSource?.numSections(in: tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let originalTableViewDataSource = originalTableViewDataSource else {
            return 0
        }

        let numberOfRows = originalTableViewDataSource.collectionSkeletonView(tableView, numberOfRowsInSection: section)

        if numberOfRows == UITableView.automaticNumberOfSkeletonRows {
            return tableView.estimatedNumberOfRows
        } else {
            return numberOfRows
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = originalTableViewDataSource?.collectionSkeletonView(tableView, skeletonCellForRowAt: indexPath) else {
            let cellIdentifier = originalTableViewDataSource?.collectionSkeletonView(tableView, cellIdentifierForRowAt: indexPath) ?? ""
            let fakeCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

            originalTableViewDataSource?.collectionSkeletonView(tableView, prepareCellForSkeleton: fakeCell, at: indexPath)
            skeletonizeViewIfContainerSkeletonIsActive(container: tableView, view: fakeCell)
            
            return fakeCell
        }

        originalTableViewDataSource?.collectionSkeletonView(tableView, prepareCellForSkeleton: cell, at: indexPath)
        skeletonizeViewIfContainerSkeletonIsActive(container: tableView, view: cell)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension SkeletonCollectionDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        originalCollectionViewDataSource?.numSections(in: collectionView) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let originalCollectionViewDataSource = originalCollectionViewDataSource else {
            return 0
        }

        let numberOfItems = originalCollectionViewDataSource.collectionSkeletonView(collectionView, numberOfItemsInSection: section)

        if numberOfItems == UICollectionView.automaticNumberOfSkeletonItems {
            return collectionView.estimatedNumberOfRows
        } else {
            return numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = originalCollectionViewDataSource?.collectionSkeletonView(collectionView, skeletonCellForItemAt: indexPath) else {
            let cellIdentifier = originalCollectionViewDataSource?.collectionSkeletonView(collectionView, cellIdentifierForItemAt: indexPath) ?? ""
            let fakeCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)

            originalCollectionViewDataSource?.collectionSkeletonView(collectionView, prepareCellForSkeleton: fakeCell, at: indexPath)
            skeletonizeViewIfContainerSkeletonIsActive(container: collectionView, view: fakeCell)
            
            return fakeCell
        }

        originalCollectionViewDataSource?.collectionSkeletonView(collectionView, prepareCellForSkeleton: cell, at: indexPath)
        skeletonizeViewIfContainerSkeletonIsActive(container: collectionView, view: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if let viewIdentifier = originalCollectionViewDataSource?.collectionSkeletonView(collectionView, supplementaryViewIdentifierOfKind: kind, at: indexPath) {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: viewIdentifier, for: indexPath)

            originalCollectionViewDataSource?.collectionSkeletonView(collectionView, prepareViewForSkeleton: view, at: indexPath)
            skeletonizeViewIfContainerSkeletonIsActive(container: collectionView, view: view)
            return view
        }
        
        return originalCollectionViewDataSource?.collectionView?(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath) ?? UICollectionReusableView()
    }
    
}

extension SkeletonCollectionDataSource {
    private func skeletonizeViewIfContainerSkeletonIsActive(container: UIView, view: UIView) {
        guard container.sk.isSkeletonActive,
              let skeletonConfig = container._currentSkeletonConfig else {
            return
        }

        view.showSkeleton(
            skeletonConfig: skeletonConfig,
            notifyDelegate: false
        )
    }
}

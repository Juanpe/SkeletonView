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
        return originalTableViewDataSource?.numSections(in: tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return originalTableViewDataSource?.collectionSkeletonView(tableView, numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = originalTableViewDataSource?.collectionSkeletonView(tableView, cellIdentifierForRowAt: indexPath) ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        skeletonViewIfContainerSkeletonIsActive(container: tableView, view: cell)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension SkeletonCollectionDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return originalCollectionViewDataSource?.numSections(in: collectionView) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return originalCollectionViewDataSource?.collectionSkeletonView(collectionView, numberOfItemsInSection: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = originalCollectionViewDataSource?.collectionSkeletonView(collectionView, cellIdentifierForItemAt: indexPath) ?? ""
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        skeletonViewIfContainerSkeletonIsActive(container: collectionView, view: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let viewIdentifier = originalCollectionViewDataSource?.collectionSkeletonView(collectionView, supplementaryViewIdentifierOfKind: kind, at: indexPath) {
            let view =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: viewIdentifier, for: indexPath)
            skeletonViewIfContainerSkeletonIsActive(container: collectionView, view: view)
            return view
        }
        
        return UICollectionReusableView()
    }
    
}

extension SkeletonCollectionDataSource {
    private func skeletonViewIfContainerSkeletonIsActive(container: UIView, view: UIView) {
        guard container.isSkeletonActive,
              let skeletonConfig = container.currentSkeletonConfig else {
            return
        }

        view.showSkeleton(skeletonConfig: skeletonConfig)
    }
}

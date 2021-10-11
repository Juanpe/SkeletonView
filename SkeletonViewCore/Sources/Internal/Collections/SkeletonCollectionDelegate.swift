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

// MARK: - UITableViewDelegate
extension SkeletonCollectionDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerOrFooterView(tableView, for: originalTableViewDelegate?.collectionSkeletonView(tableView, identifierForHeaderInSection: section))
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        headerOrFooterView(tableView, for: originalTableViewDelegate?.collectionSkeletonView(tableView, identifierForFooterInSection: section))
    }

    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        view.hideSkeleton()
        originalTableViewDelegate?.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        view.hideSkeleton()
        originalTableViewDelegate?.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.hideSkeleton()
        originalTableViewDelegate?.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? tableView.estimatedRowHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? tableView.estimatedSectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? tableView.estimatedSectionFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, heightForRowAt: indexPath) ?? tableView.rowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, heightForHeaderInSection: section) ?? tableView.sectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return originalTableViewDelegate?.tableView?(tableView, heightForFooterInSection: section) ?? tableView.sectionFooterHeight
    }

    private func headerOrFooterView(_ tableView: UITableView, for viewIdentifier: String? ) -> UIView? {
      guard let viewIdentifier = viewIdentifier, let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewIdentifier) else { return nil }
      skeletonViewIfContainerSkeletonIsActive(container: tableView, view: header)
      return header
  }
}

// MARK: - UICollectionViewDelegate
extension SkeletonCollectionDelegate: UICollectionViewDelegate { }

extension SkeletonCollectionDelegate {
    private func skeletonViewIfContainerSkeletonIsActive(container: UIView, view: UIView) {
        guard container.sk.isSkeletonActive,
              let skeletonConfig = container._currentSkeletonConfig else {
            return
        }

        view.showSkeleton(skeletonConfig: skeletonConfig)
    }
}

//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

extension UIView {
    // Comment
    @objc var subviewsSkeletonables: [UIView] {
        subviewsToSkeleton.filter { $0.isSkeletonable }
    }

    @objc var subviewsToSkeleton: [UIView] {
        subviews
    }
}

extension UITableView {
    override var subviewsToSkeleton: [UIView] {
        visibleCells + visibleSectionHeaders + visibleSectionFooters
    }
}

extension UITableViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UITableViewHeaderFooterView {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UICollectionView {
    override var subviewsToSkeleton: [UIView] {
        subviews
    }
}

extension UICollectionViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UIStackView {
    override var subviewsToSkeleton: [UIView] {
        arrangedSubviews
    }
}

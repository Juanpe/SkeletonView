//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

extension UIView {
    @objc var subviewsSkeletonables: [UIView] {
        return subviewsToSkeleton.filter { $0.isSkeletonable }
    }

    @objc var subviewsToSkeleton: [UIView] {
        return subviews
    }
}

extension UITableView {

    override var subviewsToSkeleton: [UIView] {
        return visibleCells
    }
}

extension UITableViewCell {

    override var subviewsToSkeleton: [UIView] {
        return contentView.subviews
    }
}

extension UICollectionView {

    override var subviewsToSkeleton: [UIView] {
        return subviews
    }
}

extension UICollectionViewCell {

    override var subviewsToSkeleton: [UIView] {
        return contentView.subviews
    }
}

extension UIStackView {

    override var subviewsToSkeleton: [UIView] {
        return arrangedSubviews
    }
}

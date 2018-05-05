//
//  SubviewsSkeletonables.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 05/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    @objc var subviewsSkeletonables: [UIView] {
        return subviews.filter { $0.isSkeletonable }
    }
}

extension UITableView {
    override var subviewsSkeletonables: [UIView] {
        return visibleCells.filter { $0.isSkeletonable }
    }
}

extension UITableViewCell {
    override var subviewsSkeletonables: [UIView] {
        return contentView.subviews.filter { $0.isSkeletonable }
    }
}

extension UICollectionView {
    override var subviewsSkeletonables: [UIView] {
        return subviews.filter { $0.isSkeletonable }
    }
}

extension UICollectionViewCell {
    override var subviewsSkeletonables: [UIView] {
        return contentView.subviews.filter { $0.isSkeletonable }
    }
}

extension UIStackView {
    override var subviewsSkeletonables: [UIView] {
        return arrangedSubviews.filter { $0.isSkeletonable }
    }
}

//
//  PrepareForSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 04/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    @objc func prepareViewForSkeleton() {
        startTransition { [weak self] in
            self?.backgroundColor = .clear
            self?.isUserInteractionEnabled = false
        }
    }
}

extension UILabel {
    var desiredHeightBasedOnNumberOfLines: CGFloat {
        let lineHeight = multilineTextFont?.lineHeight ?? SkeletonAppearance.default.multilineHeight
        let spaceNeededForEachLine = lineHeight * CGFloat(numberOfLines)
        let spaceNeededForSpaces = skeletonLineSpacing * CGFloat(numberOfLines - 1)
        let padding = paddingInsets.top + paddingInsets.bottom
        
        return spaceNeededForEachLine + spaceNeededForSpaces + padding
    }
    
    func updateHeightConstraintsIfNeeded() {
        guard numberOfLines > 1 else { return }
        
        let desiredHeight = desiredHeightBasedOnNumberOfLines
        if desiredHeight > definedMaxHeight {
            backupHeightConstraints = heightConstraints
            NSLayoutConstraint.deactivate(heightConstraints)
            setHeight(equalToConstant: desiredHeight)
        }
    }
    
    func restoreBackupHeightConstraints() {
        guard !backupHeightConstraints.isEmpty else { return }
        NSLayoutConstraint.deactivate(heightConstraints)
        NSLayoutConstraint.activate(backupHeightConstraints)
        backupHeightConstraints.removeAll()
    }
    
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        resignFirstResponder()
        startTransition { [weak self] in
            self?.updateHeightConstraintsIfNeeded()
            self?.textColor = .clear
        }
    }
}

extension UITextView {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        resignFirstResponder()
        startTransition { [weak self] in
            self?.textColor = .clear
        }
    }
}

extension UIImageView {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        startTransition { [weak self] in
            self?.image = nil
        }
    }
}

extension UIButton {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        startTransition { [weak self] in
            self?.setTitle(nil, for: .normal)
        }
    }
}

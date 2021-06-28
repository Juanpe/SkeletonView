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
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
        startTransition { [weak self] in
            self?.backgroundColor = .clear
        }
    }
}

extension UILabel {
    var desiredHeightBasedOnNumberOfLines: CGFloat {
        let spaceNeededForEachLine = lineHeight * CGFloat(numberOfLines)
        let spaceNeededForSpaces = skeletonLineSpacing * CGFloat(numberOfLines - 1)
        let padding = paddingInsets.top + paddingInsets.bottom
        
        return spaceNeededForEachLine + spaceNeededForSpaces + padding
    }
    
    func updateHeightConstraintsIfNeeded() {
        guard numberOfLines > 1 || numberOfLines == 0 else { return }
        
        // Workaround to simulate content when the label is contained in a `UIStackView`.
        if isSuperviewAStackView, bounds.height == 0 {
            // This is a placeholder text to simulate content because it's contained in a stack view in order to prevent that the content size will be zero.
            text = " "
        }
        
        let desiredHeight = desiredHeightBasedOnNumberOfLines
        if desiredHeight > definedMaxHeight {
            backupHeightConstraints = heightConstraints
            NSLayoutConstraint.deactivate(heightConstraints)
            setHeight(equalToConstant: desiredHeight)
        }
    }
    
    func restoreBackupHeightConstraintsIfNeeded() {
        guard !backupHeightConstraints.isEmpty else { return }
        NSLayoutConstraint.activate(backupHeightConstraints)
        backupHeightConstraints.removeAll()
    }
    
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
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
        
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
        resignFirstResponder()
        startTransition { [weak self] in
            self?.textColor = .clear
        }
    }
}

extension UITextField {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        resignFirstResponder()

        startTransition { [weak self] in
            self?.textColor = .clear
            self?.placeholder = nil
        }
    }
}

extension UIImageView {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
        startTransition { [weak self] in
            self?.image = nil
        }
    }
}

extension UIButton {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
        startTransition { [weak self] in
            self?.setTitle(nil, for: .normal)
        }
    }
}

extension UITableViewHeaderFooterView {
    override func prepareViewForSkeleton() {
        backgroundView?.backgroundColor = .clear
        
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
    }
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  PrepareViewForSkeleton.swift
//
//  Created by Juanpe Catalán on 04/11/2017.

import UIKit

extension UIView {
    
    @objc func prepareViewForSkeleton() {
        if isUserInteractionDisabledWhenSkeletonIsActive {
            isUserInteractionEnabled = false
        }
        
        startTransition { [weak self] in
            self?.backgroundColor = .clear
            self?.layer.borderColor = nil
        }
    }
    
}

extension UILabel {
    
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
            guard let self = self else { return }

            self.setTitle(nil, for: self.state)
            self.setTitleColor(nil, for: self.state)
            self.setAttributedTitle(nil, for: self.state)
            self.setImage(nil, for: self.state)
            self.setBackgroundImage(nil, for: self.state)
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

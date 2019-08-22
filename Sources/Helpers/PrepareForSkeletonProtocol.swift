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
        }
    }
}

extension UILabel {
    override func prepareViewForSkeleton() {
        backgroundColor = .clear
        resignFirstResponder()
        startTransition { [weak self] in
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

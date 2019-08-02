//
//  PrepareForSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 04/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

protocol PrepareForSkeleton {
    func prepareViewForSkeleton() 
}

extension UIView: PrepareForSkeleton {
    @objc func prepareViewForSkeleton() {
        _ = startTransitionIfAvailable()
    }
    fileprivate func startTransitionIfAvailable() -> Bool {
        if let transitionType = currentSkeletonConfig?.transition {
            switch transitionType {
            case .none:
                backgroundColor = .clear
                return false
            case .fade(duration: let duration):
                fadeOut(duration: duration)
            }
            return true
        }
        return false
    }
}

extension UILabel {
    override func prepareViewForSkeleton() {
        if startTransitionIfAvailable() == false {
            textColor = .clear
            backgroundColor = .clear
            resignFirstResponder()
        }
    }
}

extension UITextView {
    override func prepareViewForSkeleton() {
        if startTransitionIfAvailable() == false {
            textColor = .clear
            backgroundColor = .clear
            resignFirstResponder()
        }
    }
}

extension UIImageView {
    override func prepareViewForSkeleton() {
        if startTransitionIfAvailable() == false {
            backgroundColor = .clear
            image = nil
        }
    }
}

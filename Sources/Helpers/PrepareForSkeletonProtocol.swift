//
//  PrepareForSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 04/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

fileprivate typealias TransitionCompletionBlock = (_ performedTransition:Bool) -> Void

extension UIView {
    @objc func prepareViewForSkeleton() {
        startTransition { (_) in }
    }
    
    fileprivate func startTransition(_ completion: TransitionCompletionBlock? = nil) {
        guard let transitionType = currentSkeletonConfig?.transition else {
            backgroundColor = .clear
            completion?(false)
            return
        }
        
        switch transitionType {
        case .none:
            backgroundColor = .clear
            completion?(false)
        case .fade(let duration):
            fadeOut(duration: duration) { () -> () in
                completion?(true)
            }
        }
    }
}

extension UILabel {
    override func prepareViewForSkeleton() {
        startTransition { (performedTransition) in
            if !performedTransition {
                self.textColor = .clear
            }
            self.resignFirstResponder()
        }
    }
}

extension UITextView {
    override func prepareViewForSkeleton() {
        startTransition { (performedTransition) in
            if !performedTransition {
                self.textColor = .clear
            }
            self.resignFirstResponder()
        }
    }
}

extension UIImageView {
    override func prepareViewForSkeleton() {
        startTransition { (performedTransition) in
            if !performedTransition {
                self.image = nil
            }
        }
    }
}

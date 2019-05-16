//
//  PrepareForSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 04/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public protocol PrepareForSkeleton {
    func prepareViewForSkeleton()
}

extension UILabel: PrepareForSkeleton {
    public func prepareViewForSkeleton() {
        text = " "
        resignFirstResponder()
    }
}

extension UITextView: PrepareForSkeleton {
    public func prepareViewForSkeleton() {
        text = " "
        resignFirstResponder()
    }
}

extension UIImageView: PrepareForSkeleton {
    public func prepareViewForSkeleton() {
        image = nil
    }
}

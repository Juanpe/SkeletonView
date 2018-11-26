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

extension UILabel: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        text = " "
        resignFirstResponder()
    }
}

extension UITextView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        text = " "
        resignFirstResponder()
    }
}

extension UIImageView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        image = nil
    }
}

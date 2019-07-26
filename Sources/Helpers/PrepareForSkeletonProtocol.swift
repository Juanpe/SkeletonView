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
    func prepareViewForSkeleton() {
        self.fadeOut()
    }
}

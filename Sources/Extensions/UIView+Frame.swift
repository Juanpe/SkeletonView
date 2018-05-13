//
//  UIView+Frame.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

// MARK: Frame
extension UIView {
    
    var maxBoundsEstimated: CGRect {
        return CGRect(origin: .zero, size: maxSizeEstimated)
    }
    
    var maxSizeEstimated: CGSize {
        return CGSize(width: maxWidthEstimated, height: maxHeightEstimated)
    }
    
    var maxWidthEstimated: CGFloat {
        let constraintsWidth = nonContentSizeLayoutConstraints.filter({ $0.firstAttribute == NSLayoutAttribute.width })
        return max(between: frame.size.width, andContantsOf: constraintsWidth)
    }
    
    var maxHeightEstimated: CGFloat {
        let constraintsHeight = nonContentSizeLayoutConstraints.filter({ $0.firstAttribute == NSLayoutAttribute.height })
        return max(between: frame.size.height, andContantsOf: constraintsHeight)
    }
    
    private func max(between value: CGFloat, andContantsOf constraints: [NSLayoutConstraint]) -> CGFloat {
        let max = constraints.reduce(value, { max, constraint in
            var tempMax = max
            if constraint.constant > tempMax { tempMax = constraint.constant }
            return tempMax
        })
        return max
    }
    
    var nonContentSizeLayoutConstraints: [NSLayoutConstraint] {
        return constraints.filter({ "\(type(of: $0))" != "NSContentSizeLayoutConstraint" })
    }
}

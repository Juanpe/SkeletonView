//
//  NSView+Frame.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

// MARK: Frame
extension NSView {
    
    var maxBoundsEstimated: CGRect {
        return CGRect(origin: .zero, size: maxSizeEstimated)
    }
    
    var maxSizeEstimated: CGSize {
        return CGSize(width: maxWidthEstimated, height: maxHeightEstimated)
    }
    
    var maxWidthEstimated: CGFloat {
        let constraintsWidth = constraints.filter({ $0.firstAttribute == .width })
        return max(between: frame.size.width, andContantsOf: constraintsWidth)
    }
    
    var maxHeightEstimated: CGFloat {
        let constraintsHeight = constraints.filter({ $0.firstAttribute == .height })
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
}

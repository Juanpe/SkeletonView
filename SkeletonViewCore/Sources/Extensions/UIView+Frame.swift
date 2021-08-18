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
    var definedMaxBounds: CGRect {
        if let parentStackView = (superview as? UIStackView) {
            var origin: CGPoint = .zero
            switch parentStackView.alignment {
            case .trailing:
                origin.x = definedMaxWidth
            default:
                break
            }
            return CGRect(origin: origin, size: definedMaxSize)
        }
        return CGRect(origin: .zero, size: definedMaxSize)
    }
    
    var definedMaxSize: CGSize {
        CGSize(width: definedMaxWidth, height: definedMaxHeight)
    }
    
    var definedMaxWidth: CGFloat {
        max(between: frame.size.width, andContantsOf: widthConstraints)
    }
    
    var definedMaxHeight: CGFloat {
        max(between: frame.size.height, andContantsOf: heightConstraints)
    }
    
    var isRTL: Bool {
        if #available(iOS 10.0, *), #available(tvOS 10.0, *) {
            return effectiveUserInterfaceLayoutDirection == .rightToLeft
        } else {
            return false
        }
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

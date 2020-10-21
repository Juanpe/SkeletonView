// Copyright © 2020 SkeletonView. All rights reserved.

import UIKit

// MARK: Frame
extension UIView {
    var widthConstraints: [NSLayoutConstraint] {
        nonContentSizeLayoutConstraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.width }
    }
    
    var heightConstraints: [NSLayoutConstraint] {
        nonContentSizeLayoutConstraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.height }
    }
    
    @discardableResult
    func setHeight(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        let heightConstraint = heightAnchor.constraint(equalToConstant: constant)
        NSLayoutConstraint.activate([heightConstraint])
        return heightConstraint
    }
    
    var nonContentSizeLayoutConstraints: [NSLayoutConstraint] {
        constraints.filter({ "\(type(of: $0))" != "NSContentSizeLayoutConstraint" })
    }
}

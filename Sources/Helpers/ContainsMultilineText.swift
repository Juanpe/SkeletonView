//
//  ContainsMultilineText.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 07/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

private enum AssociatedKeys {
    static var lastLineFillingPercent = "lastLineFillingPercent"
}

protocol ContainsMultilineText {
    var numLines: Int { get }
    var lastLineFillingPercent: Int { get }
}

extension ContainsMultilineText {
    var numLines: Int { return 0 }
}

public extension UILabel {
    
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }
}

public extension UITextView {
    
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }
}

extension UILabel: ContainsMultilineText {
    var numLines: Int { 
        return numberOfLines
    }
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
}
extension UITextView: ContainsMultilineText {
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
}

//
//  ContainsMultilineText.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

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

public extension NSTextField {
    
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }
}

public extension NSTextView {
    
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }
}

extension NSTextField: ContainsMultilineText {
    var numLines: Int {
        return maximumNumberOfLines
    }
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
}

extension NSTextView: ContainsMultilineText {
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
}

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
    static var desiredMultilineHeight = "desiredMultilineHeight"
    static var desiredNumberOfLines = "desiredNumberOfLines"
}

protocol ContainsMultilineText {
    var numLines: Int { get }
    var lastLineFillingPercent: Int { get }
    var desiredMultilineHeight: CGFloat { get }
    var desiredNumberOfLines: Int { get }
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
    
    @IBInspectable
    var desiredMultilineHeight: CGFloat {
        get { return desiredLineHeight }
        set { desiredLineHeight = max(newValue, 0) }
    }
    
    @IBInspectable
    var desiredNumberOfLines: Int {
        get { return desiredLines }
        set { desiredLines = min(newValue, 100) }
    }
}

public extension NSTextView {
    
    @IBInspectable
    var lastLineFillPercent: Int {
        get { return lastLineFillingPercent }
        set { lastLineFillingPercent = min(newValue, 100) }
    }
    
    @IBInspectable
    var desiredMultilineHeight: CGFloat {
        get { return desiredLineHeight }
        set { desiredLineHeight = max(newValue, 0) }
    }
    
    @IBInspectable
    var desiredNumberOfLines: Int {
        get { return desiredLines }
        set { desiredLines = min(newValue, 100) }
    }
}

extension NSTextField: ContainsMultilineText {
    var numLines: Int {
        return desiredNumberOfLines
    }
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
    
    var desiredLineHeight: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.desiredMultilineHeight) as? CGFloat ?? SkeletonDefaultConfig.multilineHeight }
        set { objc_setAssociatedObject(self, &AssociatedKeys.desiredMultilineHeight, newValue, AssociationPolicy.retain.objc) }
    }
    
    var desiredLines: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.desiredNumberOfLines) as? Int ?? 0 }
        set { objc_setAssociatedObject(self, &AssociatedKeys.desiredNumberOfLines, newValue, AssociationPolicy.retain.objc) }
    }
}

extension NSTextView: ContainsMultilineText {
    
    var lastLineFillingPercent: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonDefaultConfig.multilineLastLineFillPercent }
        set { objc_setAssociatedObject(self, &AssociatedKeys.lastLineFillingPercent, newValue, AssociationPolicy.retain.objc) }
    }
    
    var desiredLineHeight: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.desiredMultilineHeight) as? CGFloat ?? SkeletonDefaultConfig.multilineHeight }
        set { objc_setAssociatedObject(self, &AssociatedKeys.desiredMultilineHeight, newValue, AssociationPolicy.retain.objc) }
    }
    
    var desiredLines: Int {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.desiredNumberOfLines) as? Int ?? 0 }
        set { objc_setAssociatedObject(self, &AssociatedKeys.desiredNumberOfLines, newValue, AssociationPolicy.retain.objc) }
    }
}

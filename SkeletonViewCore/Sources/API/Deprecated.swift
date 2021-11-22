//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  Deprecated.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

public extension Notification.Name {
    
    @available(*, deprecated, renamed: "skeletonWillAppear")
    static let willBeginShowingSkeletons = Notification.Name.skeletonWillAppearNotification
    
    @available(*, deprecated, renamed: "skeletonDidAppear")
    static let didShowSkeletons = Notification.Name.skeletonDidAppearNotification
    
    @available(*, deprecated, renamed: "skeletonWillUpdate")
    static let willBeginUpdatingSkeletons = Notification.Name.skeletonWillUpdateNotification
    
    @available(*, deprecated, renamed: "skeletonDidUpdate")
    static let didUpdateSkeletons = Notification.Name.skeletonDidUpdateNotification
    
    @available(*, deprecated, renamed: "skeletonWillDisappear")
    static let willBeginHidingSkeletons = Notification.Name.skeletonWillDisappearNotification
    
    @available(*, deprecated, renamed: "skeletonDidDisappear")
    static let didHideSkeletons = Notification.Name.skeletonDidDisappearNotification
    
}

public extension UIView {
    
    @available(*, deprecated, renamed: "sk.treeNodesDescription")
    var skeletonDescription: String {
        sk.skeletonTreeDescription
    }
    
    @available(*, deprecated, renamed: "sk.isSkeletonActive")
    var isSkeletonActive: Bool {
        sk.isSkeletonActive
    }
    
}

public extension UILabel {
    
    @IBInspectable
    @available(*, deprecated, renamed: "skeletonTextLineHeight")
    var useFontLineHeight: Bool {
        get {
            textLineHeight == .relativeToFont
        }
        set {
            textLineHeight = newValue ? .relativeToFont : .fixed(SkeletonAppearance.default.multilineHeight)
        }
    }
    
}

public extension UITextView {
    
    @IBInspectable
    @available(*, deprecated, renamed: "skeletonTextLineHeight")
    var useFontLineHeight: Bool {
        get {
            textLineHeight == .relativeToFont
        }
        set {
            textLineHeight = newValue ? .relativeToFont : .fixed(SkeletonAppearance.default.multilineHeight)
        }
    }
    
}

public extension SkeletonViewAppearance {
    
    @available(*, deprecated, renamed: "textLineHeight")
    var useFontLineHeight: Bool {
        get {
            textLineHeight == .relativeToFont
        }
        set {
            textLineHeight = newValue ? .relativeToFont : .fixed(SkeletonAppearance.default.multilineHeight)
        }
    }
    
}

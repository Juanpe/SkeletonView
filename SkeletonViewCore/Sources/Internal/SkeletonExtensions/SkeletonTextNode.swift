//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonTextNode.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

protocol SkeletonTextNode {
    
    var lineHeight: CGFloat { get }
    var numberOfLines: Int { get }
    var textAlignment: NSTextAlignment { get }
    var lastLineFillingPercent: Int { get }
    var multilineCornerRadius: Int { get }
    var multilineSpacing: CGFloat { get }
    var paddingInsets: UIEdgeInsets { get }
    
}

enum SkeletonTextNodeAssociatedKeys {
    static var lastLineFillingPercent = "lastLineFillingPercent"
    static var multilineCornerRadius = "multilineCornerRadius"
    static var multilineSpacing = "multilineSpacing"
    static var paddingInsets = "paddingInsets"
    static var backupHeightConstraints = "backupHeightConstraints"
}

extension UILabel: SkeletonTextNode {
    
    var lineHeight: CGFloat {
        if let fontLineHeight = font?.lineHeight {
            if let heightConstraints = backupHeightConstraints.first?.constant {
                return (fontLineHeight > heightConstraints) ? heightConstraints : fontLineHeight
            }
            return fontLineHeight
        }
        return SkeletonAppearance.default.multilineHeight
    }
    
    var lastLineFillingPercent: Int {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.lastLineFillingPercent) as? Int ?? SkeletonAppearance.default.multilineLastLineFillPercent }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.lastLineFillingPercent) }
    }

    var multilineCornerRadius: Int {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.multilineCornerRadius) as? Int ?? SkeletonAppearance.default.multilineCornerRadius }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.multilineCornerRadius) }
    }

    var multilineSpacing: CGFloat {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.multilineSpacing) as? CGFloat ?? SkeletonAppearance.default.multilineSpacing }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.multilineSpacing) }
    }

    var paddingInsets: UIEdgeInsets {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.paddingInsets) as? UIEdgeInsets ?? .zero }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.paddingInsets) }
    }
    
    var backupHeightConstraints: [NSLayoutConstraint] {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.backupHeightConstraints) as? [NSLayoutConstraint] ?? [] }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.backupHeightConstraints) }
    }
    
}

extension UITextView: SkeletonTextNode {
    
    var lineHeight: CGFloat {
        if let fontLineHeight = font?.lineHeight {
            if let heightConstraints = heightConstraints.first?.constant {
                return (fontLineHeight > heightConstraints) ? heightConstraints : fontLineHeight
            }
            
            return fontLineHeight
        }
        
        return SkeletonAppearance.default.multilineHeight
    }
    
    var numberOfLines: Int {
        -1
    }
    
    var lastLineFillingPercent: Int {
        get {
            let defaultValue = SkeletonAppearance.default.multilineLastLineFillPercent
            return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.lastLineFillingPercent) as? Int ?? defaultValue
        }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.lastLineFillingPercent) }
    }

    var multilineCornerRadius: Int {
        get {
            let defaultValue = SkeletonAppearance.default.multilineCornerRadius
            return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.multilineCornerRadius) as? Int ?? defaultValue
        }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.multilineCornerRadius) }
    }

    var multilineSpacing: CGFloat {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.multilineSpacing) as? CGFloat ?? SkeletonAppearance.default.multilineSpacing }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.multilineSpacing) }
    }

    var paddingInsets: UIEdgeInsets {
        get { return ao_get(pkey: &SkeletonTextNodeAssociatedKeys.paddingInsets) as? UIEdgeInsets ?? .zero }
        set { ao_set(newValue, pkey: &SkeletonTextNodeAssociatedKeys.paddingInsets) }
    }
    
}

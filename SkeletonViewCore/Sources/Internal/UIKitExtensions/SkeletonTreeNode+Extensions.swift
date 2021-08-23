//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonTreeNode+Extensions.swift
//
//  Created by Juanpe Catalán on 23/8/21.

import UIKit

extension UIView: SkeletonViewExtended { }

extension SkeletonTreeNode where Base: UIView {
    
    var children: [SkeletonTreeNode<UIView>] {
        base.subviewsSkeletonables.map { $0.sk.treeNode }
    }
    
    var parent: SkeletonTreeNode<UIView>? {
        base.superview?.sk.treeNode
    }
    
}

// MARK: Debug

extension SkeletonTreeNode where Base: UIView {
    
    var dictionaryRepresentation: [String: Any] {
        let children = children
        
        var nodeInfo: [String: Any] = [
            "type": "\(type(of: base))",
            "reference": "\(Unmanaged.passUnretained(base).toOpaque())",
            "isSkeletonable": base.isSkeletonable
        ]
        
        if !children.isEmpty {
            nodeInfo["children"] = children.map { $0.dictionaryRepresentation }
        }
        
        return nodeInfo
    }
    
}

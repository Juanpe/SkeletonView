//
//  AssociationPolicy.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import Foundation

//Partially copy/pasted from https://github.com/jameslintaylor/AssociatedObjects/blob/master/AssociatedObjects/AssociatedObjects.swift
enum AssociationPolicy: UInt {
    // raw values map to objc_AssociationPolicy's raw values
    case assign = 0
    case copy = 771
    case copyNonatomic = 3
    case retain = 769
    case retainNonatomic = 1
    
    var objc: objc_AssociationPolicy {
        return objc_AssociationPolicy(rawValue: rawValue)!
    }
}

enum AssociatedKeys {
    static var skeletonable = "skeletonable"
    static var status = "status"
    static var skeletonLayer = "layer"
    static var flowDelegate = "flowDelegate"
    static var isSkeletonAnimated = "isSkeletonAnimated"
    static var viewState = "viewState"
    static var lastLineFillingPercent = "lastLineFillingPercent"
    static var multilineCornerRadius = "multilineCornerRadius"
}

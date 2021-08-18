//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SkeletonDebugTests.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import XCTest
@testable import SkeletonView

class SkeletonDebugTests: XCTestCase {

    func testSkeletonDescriptionWithViewNotSkeletonableNotReturnsSkullEmojiAndChildren() {
        /// given
        let view = UIView()
        let expectedDescription = "<UIView: \(Unmanaged.passUnretained(view).toOpaque())>"
        
        /// when
        let obtainedDescription = view.skeletonDescription
        
        /// then
        XCTAssertEqual(expectedDescription, obtainedDescription)
    }
    
    func testSkeletonDescriptionWithViewSkeletonableReturnsSkullEmojiButNotChildren() {
        /// given
        let view = UIView()
        view.isSkeletonable = true
        let expectedDescription = "<UIView: \(Unmanaged.passUnretained(view).toOpaque()) | ☠️ >"
        
        /// when
        let obtainedDescription = view.skeletonDescription
        
        /// then
        XCTAssertEqual(expectedDescription, obtainedDescription)
    }
    
    func testSkeletonDescriptionWithViewSkeletonableAndChildrenReturnsSkullEmojiAndChildren() {
        /// given
        let view = UIView()
        let childView = UIView()
        view.addSubview(childView)
        view.isSkeletonable = true
        childView.isSkeletonable = true
        let expectedDescription = """
            <UIView: \(Unmanaged.passUnretained(view).toOpaque()) | (1) subSkeletons | ☠️ >
            """
        
        /// when
        let obtainedDescription = view.skeletonDescription
        
        /// then
        XCTAssertEqual(expectedDescription, obtainedDescription)
    }
    
    func testSkeletonHierarchyWithSkeletonableViewsReturnsFullHierarchy() {
        /// given
        let view = UIView()
        let childView = UIView()
        let subchildView = UIView()
        view.addSubview(childView)
        childView.addSubview(subchildView)
        view.isSkeletonable = true
        childView.isSkeletonable = true
        subchildView.isSkeletonable = true
        
        let expectedDescription = "⬇⬇ ☠️ Root view hierarchy with Skeletons ⬇⬇<UIView:\(Unmanaged.passUnretained(view).toOpaque()) | (1) subSkeletons | ☠️ ><UIView: \(Unmanaged.passUnretained(childView).toOpaque()) | (1) subSkeletons | ☠️ ><UIView: \(Unmanaged.passUnretained(subchildView).toOpaque()) | ☠️ >"
            .replacingOccurrences(of: " ", with: "")
        
        /// when
        let obtainedDescription = view.skeletonHierarchy()
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: " ", with: "")
        
        /// then
        XCTAssertEqual(expectedDescription, obtainedDescription)
    }

}

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
        let expectedDictionary: [String : Any] = [
            "isSkeletonable" : false,
            "type" : "UIView",
            "reference" : "\(Unmanaged.passUnretained(view).toOpaque())"
        ]
        
        /// when
        let obtainedDictionary = view.sk.treeNode.dictionaryRepresentation
        
        /// then
        XCTAssertEqual(expectedDictionary.keys, obtainedDictionary.keys)
    }

}

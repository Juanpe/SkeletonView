//
//  ContainsMultilineText.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 07/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

protocol ContainsMultilineText {
    var numLines: Int { get }
}

extension ContainsMultilineText {
    var numLines: Int { return 0 }
}

extension UILabel: ContainsMultilineText {
    var numLines: Int { 
        return numberOfLines
    }
}
extension UITextView: ContainsMultilineText {}

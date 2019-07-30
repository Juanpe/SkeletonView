//
//  RecoverableViewState.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

struct RecoverableViewState {
    var backgroundColor: UIColor?
    var cornerRadius: CGFloat
    var clipToBounds: Bool
    
    // UI text
    var text: String?
    var textColor:UIColor?
    
    // UI image
    var image: UIImage?
}

extension RecoverableViewState {
    init(view: UIView) {
        self.backgroundColor = view.backgroundColor
        self.clipToBounds = view.layer.masksToBounds
        self.cornerRadius = view.layer.cornerRadius
        
        if let view  = view as? UILabel {
            self.textColor = view.textColor
            self.text = view.text
        }
        else if let view  = view as? UIImageView {
            self.image = view.image
        }
    }
}

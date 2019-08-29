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

    init(view: UIView) {
        self.backgroundColor = view.backgroundColor
        self.clipToBounds = view.layer.masksToBounds
        self.cornerRadius = view.layer.cornerRadius
    }
}

struct RecoverableTextViewState {
    var attributedText: NSAttributedString?
    var textColor: UIColor?

    init(view: UILabel) {
        self.textColor = view.textColor
        self.attributedText = view.attributedText
    }

    init(view: UITextView) {
        self.textColor = view.textColor
        self.attributedText = view.attributedText
    }
}

struct RecoverableImageViewState {
    var image: UIImage?

    init(view: UIImageView) {
        self.image = view.image
    }
}

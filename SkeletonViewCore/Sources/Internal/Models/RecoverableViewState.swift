//
//  RecoverableViewState.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

@MainActor
struct RecoverableViewState {
    
    var backgroundColor: UIColor?
    var cornerRadius: CGFloat
    var clipToBounds: Bool
    var isUserInteractionsEnabled: Bool
    
    init(view: UIView) {
        self.backgroundColor = view.backgroundColor
        self.clipToBounds = view.layer.masksToBounds
        self.cornerRadius = view.layer.cornerRadius
        self.isUserInteractionsEnabled = view.isUserInteractionEnabled
    }
    
}

@MainActor
struct RecoverableLabelState {
    var attributedText: NSAttributedString? // we mess with `textColor`, which impacts attributed string if defined
    var text: String? // we mess with `text` if the label is within a `UIStackView`
    var textColor: UIColor?

    init(view: UILabel) {
        if let attributedText = view.attributedText {
            self.attributedText = attributedText
        } else {
            self.text = view.text
        }
        self.textColor = view.textColor
    }
}

@MainActor
struct RecoverableTextViewState {
    var attributedText: NSAttributedString? // we mess with `textColor`, which impacts attributed string if defined
    var textColor: UIColor?
    
    init(view: UITextView) {
        self.attributedText = view.attributedText
        self.textColor = view.textColor
    }
}

@MainActor
struct RecoverableTextFieldState {
    var attributedText: NSAttributedString? // we mess with `textColor`, which impacts attributed string if defined
    var textColor: UIColor?
    var placeholder: String?

    init(view: UITextField) {
        self.attributedText = view.attributedText
        self.textColor = view.textColor
        self.placeholder = view.placeholder
    }
}

@MainActor
struct RecoverableImageViewState {
    var image: UIImage?
    
    init(view: UIImageView) {
        self.image = view.image
    }
}

@MainActor
struct RecoverableButtonViewState {
    var title: String?
    
    init(view: UIButton) {
        self.title = view.titleLabel?.text
    }
}

@MainActor
struct RecoverableTableViewHeaderFooterViewState {
    var backgroundViewColor: UIColor?
    
    init(view: UITableViewHeaderFooterView) {
        self.backgroundViewColor = view.backgroundView?.backgroundColor
    }
}

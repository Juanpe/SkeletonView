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
    var borderColor: CGColor?
    var isUserInteractionsEnabled: Bool
    
    init(view: UIView) {
        self.backgroundColor = view.backgroundColor
        self.clipToBounds = view.layer.masksToBounds
        self.cornerRadius = view.layer.cornerRadius
        self.borderColor = view.layer.borderColor
        self.isUserInteractionsEnabled = view.isUserInteractionEnabled
    }
    
}

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

struct RecoverableTextViewState {
    var attributedText: NSAttributedString? // we mess with `textColor`, which impacts attributed string if defined
    var textColor: UIColor?
    
    init(view: UITextView) {
        self.attributedText = view.attributedText
        self.textColor = view.textColor
    }
}

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

struct RecoverableImageViewState {
    var image: UIImage?
    
    init(view: UIImageView) {
        self.image = view.image
    }
}

struct RecoverableButtonViewState {
    var state: UIControl.State
    var attributedTitle: NSAttributedString?
    var title: String?
    var titleColor: UIColor?
    var image: UIImage?
    var backgroundImage: UIImage?
    
    init(view: UIButton) {
        self.state = view.state
        self.attributedTitle = view.attributedTitle(for: state)
        self.title = view.title(for: state)
        self.titleColor = view.titleColor(for: state)
        self.image = view.image(for: state)
        self.backgroundImage = view.backgroundImage(for: state)
    }
}

struct RecoverableTableViewHeaderFooterViewState {
    var backgroundViewColor: UIColor?
    
    init(view: UITableViewHeaderFooterView) {
        self.backgroundViewColor = view.backgroundView?.backgroundColor
    }
}

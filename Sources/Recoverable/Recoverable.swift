//
//  Recoverable.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

protocol Recoverable {
    func saveViewState()
    func recoverViewState(forced: Bool)
}

extension UIView: Recoverable {
    var viewState: RecoverableViewState? {
        get { return ao_get(pkey: &ViewAssociatedKeys.viewState) as? RecoverableViewState }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.viewState) }
    }
    
    @objc func saveViewState() {
        viewState = RecoverableViewState(view: self)
    }
    
    @objc func recoverViewState(forced: Bool) {
        guard let safeViewState = viewState else { return }
        
        startTransition { [weak self] in
            self?.layer.cornerRadius = safeViewState.cornerRadius
            self?.layer.masksToBounds = safeViewState.clipToBounds
            
            if safeViewState.backgroundColor != self?.backgroundColor || forced {
                self?.backgroundColor = safeViewState.backgroundColor
            }
        }
    }
}

extension UILabel {
    var labelState: RecoverableTextViewState? {
        get { return ao_get(pkey: &ViewAssociatedKeys.labelViewState) as? RecoverableTextViewState }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.labelViewState) }
    }
    
    override func saveViewState() {
        super.saveViewState()
        labelState = RecoverableTextViewState(view: self)
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        startTransition { [weak self] in
            self?.textColor = self?.labelState?.textColor
            self?.text = self?.labelState?.text
            self?.isUserInteractionEnabled = self?.labelState?.isUserInteractionsEnabled ?? false
        }
    }
}

extension UITextView {
    var textState: RecoverableTextViewState? {
        get { return ao_get(pkey: &ViewAssociatedKeys.labelViewState) as? RecoverableTextViewState }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.labelViewState) }
    }
    
    override func saveViewState() {
        super.saveViewState()
        textState = RecoverableTextViewState(view: self)
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        startTransition { [weak self] in
            self?.textColor = self?.textState?.textColor
            self?.text = self?.textState?.text
            self?.isUserInteractionEnabled = self?.textState?.isUserInteractionsEnabled ?? false
        }
    }
}

extension UIImageView {
    var imageState: RecoverableImageViewState? {
        get { return ao_get(pkey: &ViewAssociatedKeys.imageViewState) as? RecoverableImageViewState }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.imageViewState) }
    }
    
    override func saveViewState() {
        super.saveViewState()
        imageState = RecoverableImageViewState(view: self)
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        startTransition { [weak self] in
            self?.image = self?.image == nil || forced ? self?.imageState?.image : self?.image
        }
    }
}

extension UIButton {
    var buttonState: RecoverableButtonViewState? {
        get { return ao_get(pkey: &ViewAssociatedKeys.buttonViewState) as? RecoverableButtonViewState }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.buttonViewState) }
    }
    
    override func saveViewState() {
        super.saveViewState()
        buttonState = RecoverableButtonViewState(view: self)
    }
    
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        startTransition { [weak self] in
            self?.setTitle(self?.buttonState?.title, for: .normal)
            self?.isUserInteractionEnabled = self?.buttonState?.isUserInteractionsEnabled ?? false
        }
    }
}

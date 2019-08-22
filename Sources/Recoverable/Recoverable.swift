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

extension UILabel{
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
        }
    }
}

extension UITextView{
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

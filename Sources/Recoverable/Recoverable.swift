//
//  Recoverable.swift
//  SkeletonView
//
//  Created by Juanpe Catalán on 13/05/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

protocol Recoverable {
    var viewState: RecoverableViewState? { get set }
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
        
        layer.cornerRadius = safeViewState.cornerRadius
        layer.masksToBounds = safeViewState.clipToBounds
        
        startTransitionIfAvailable()
        
        if safeViewState.backgroundColor != backgroundColor || forced {
            backgroundColor = safeViewState.backgroundColor
        }
    }
    
    fileprivate func startTransitionIfAvailable() {
        if let transitionType = currentSkeletonConfig?.transition {
            switch transitionType {
            case .none:
                recover()
            case .fade(duration: let duration):
                fadeIn(duration: duration)
            }
        }
    }
    
    @objc fileprivate func recover() {}
}

extension UILabel {
    override func recover() {
        textColor = viewState?.textColor
    }
}

extension UIImageView {
    override func recoverViewState(forced: Bool) {
        super.recoverViewState(forced: forced)
        image = image == nil || forced ? viewState?.image : image
    }
}

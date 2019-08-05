// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit


@objc protocol FadeProtocol {
    typealias fadeOptionalVoidBlock = ()->()
    func fade(duration:TimeInterval, fadeIn: Bool, _ completion: @escaping fadeOptionalVoidBlock)
}

extension UIView:FadeProtocol {
    func fade(duration:TimeInterval, fadeIn: Bool, _ completion: @escaping fadeOptionalVoidBlock) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion()
        }
        guard let sublayers = self.layer.sublayers else {
            return
        }
        
        for tempLayer in sublayers {
            handleLayer(layer: tempLayer, fadeIn: fadeIn, duration: duration)
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: fadeIn)
    }
}

extension UILabel{
    override func fade(duration:TimeInterval, fadeIn: Bool, _ completion: @escaping fadeOptionalVoidBlock) {
        UIView.transition(with: self, duration: duration, options: .curveEaseOut, animations: {
            self.textColor = fadeIn ? self.labelState?.textColor : .clear
        }) { (_) in
            completion()
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: fadeIn)
    }
}

extension UITextView {
    override func fade(duration:TimeInterval, fadeIn: Bool, _ completion: @escaping fadeOptionalVoidBlock) {
        UIView.transition(with: self, duration: duration, options: .curveEaseInOut, animations: {
            self.textColor = fadeIn ? self.textState?.textColor : .clear
        }) { (_) in
            completion()
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: fadeIn)
    }
}

extension UIImageView {
    override func fade(duration:TimeInterval, fadeIn: Bool, _ completion: @escaping fadeOptionalVoidBlock) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = fadeIn ? self.imageState?.image : nil
        }) { (_) in
            completion()
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: fadeIn)
    }
}

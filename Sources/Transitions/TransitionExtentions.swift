// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit


internal extension UIView {
    @objc func fadeIn(duration:TimeInterval) {
        fade(duration: duration, fadeIn: true)
    }
    
    @objc func fadeOut(duration:TimeInterval) {
        fade(duration: duration, fadeIn: false)
    }
    
    fileprivate func fade(duration:TimeInterval, fadeIn: Bool) {
        guard let sublayers = self.layer.sublayers else {
            return
        }
        
        for tempLayer in sublayers {
            handleLayer(layer: tempLayer, fadeIn: fadeIn, duration: duration)
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: fadeIn)
    }
    
    fileprivate func handleLayer(layer:CALayer, fadeIn:Bool, duration:TimeInterval) {
        if layer.isSkeletonLayer {
            return
        }
        if duration != 0 {
            fadeLayer(layer: layer, duration: duration, fadeIn: fadeIn)
        }
        else {
            layer.opacity = fadeIn ? 1 : 2
        }
    }
    
    fileprivate func fadeLayer(layer:CALayer, duration:Double, fadeIn:Bool) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = fadeIn ? 0 : 1
        animation.toValue = fadeIn ? 1 : 0
        animation.duration = duration
        
        layer.opacity = fadeIn ? 1 : 0
        layer.add(animation, forKey: nil)
    }
    
    fileprivate func fadeBackgroundColor(duration:Double, fadeIn:Bool) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.backgroundColor = fadeIn ? self.viewState?.backgroundColor : .clear
        }, completion: nil)
    }
}

internal extension UILabel {
    override func fadeIn(duration:TimeInterval) {
        if duration == 0 {
            self.textColor = (self.viewState as? RecoverableTextViewState)?.textColor
            return
        }
        
        UIView.transition(with: self, duration: duration, options: .curveEaseInOut, animations: {
            self.textColor = (self.viewState as? RecoverableTextViewState)?.textColor
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: true)
    }
    
    override func fadeOut(duration:TimeInterval) {
        if duration == 0 {
            self.textColor = .clear
            return
        }
        
        UIView.transition(with: self, duration: duration, options: .curveEaseInOut, animations: {
            self.textColor = .clear
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: false)
    }
}


internal extension UIImageView {
    override func fadeIn(duration:TimeInterval) {
        if duration == 0 {
            self.image = (self.viewState as? RecoverableImageViewState)?.image
            return
        }
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = (self.viewState as? RecoverableImageViewState)?.image
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: true)
    }
    
    override func fadeOut(duration:TimeInterval) {
        if duration == 0 {
            self.image = nil
            return
        }
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = nil
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: false)
    }
}

internal extension SkeletonLayer {
    func fadeIn(duration:Double) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        
        contentLayer.opacity = 1
        contentLayer.add(animation, forKey: nil)
    }
    
    func fadeOut(duration:Double = 0, completion: @escaping () ->()) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = duration
        
        contentLayer.opacity = 0
        contentLayer.add(animation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion()
        }
    }
}


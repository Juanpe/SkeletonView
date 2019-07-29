// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit


extension UIView {
    @objc func fadeIn() {
        guard let sublayers = self.layer.sublayers else {
            return
        }
        
        let duration = currentSkeletonConfig?.fadeInDuration ?? 0
        
        for tempLayer in sublayers {
            if tempLayer.isSkeletonLayer {
                return
            }
            if let duration = currentSkeletonConfig?.fadeInDuration, duration != 0 {
                fadeLayer(layer: tempLayer, duration: duration, fadeIn: true)
            }
            else {
                tempLayer.opacity = 1
            }
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: true)
    }
    
    @objc func fadeOut() {
        guard let sublayers = self.layer.sublayers else {
            return
        }
        
        let duration = currentSkeletonConfig?.fadeInDuration ?? 0
        
        for tempLayer in sublayers {
            if tempLayer.isSkeletonLayer {
                return
            }
            if duration != 0 {
                fadeLayer(layer: tempLayer, duration: duration, fadeIn: false)
            }
            else {
                tempLayer.opacity = 0
            }
        }
        
        fadeBackgroundColor(duration: duration, fadeIn: false)
    }
    
    func fadeLayer(layer:CALayer, duration:Double, fadeIn:Bool) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = fadeIn ? 0 : 1
        animation.toValue = fadeIn ? 1 : 0
        animation.duration = duration
        
        layer.opacity = fadeIn ? 1 : 0
        layer.add(animation, forKey: nil)
    }
    
    func fadeBackgroundColor(duration:Double, fadeIn:Bool) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.backgroundColor = fadeIn ? self.viewState?.backgroundColor : .clear
        }, completion: nil)
    }
}

extension UILabel {
    override func fadeIn() {
        let duration = (currentSkeletonConfig?.fadeOutDuration ?? 0)
        if duration == 0 {
            self.textColor = self.viewState?.textColor
            return
        }
        
        UIView.transition(with: self, duration: duration, options: .curveEaseInOut, animations: {
            self.textColor = self.viewState?.textColor
        }) { (finished) in
            
        }
        /*
        let changeColorTransition = CATransition()
        changeColorTransition.duration = duration
        
        
        CATransaction.begin()
        self.layer.add(changeColorTransition, forKey: nil)
        CATransaction.setCompletionBlock {
            self.textColor = self.viewState?.textColor
        }
        CATransaction.commit()
        */
        fadeBackgroundColor(duration: duration, fadeIn: true)
    }
    
    override func fadeOut() {
        let duration = (currentSkeletonConfig?.fadeInDuration ?? 0)
        if duration == 0 {
            self.textColor = .clear
            return
        }
        
        let changeColorTransition = CATransition()
        changeColorTransition.duration = duration
        
        CATransaction.begin()
        self.layer.add(changeColorTransition, forKey: nil)
        CATransaction.setCompletionBlock {
            self.textColor = .clear
        }
        CATransaction.commit()
        
        fadeBackgroundColor(duration: duration, fadeIn: false)
    }
}


extension UIImageView {
    override func fadeIn() {
        let duration = (currentSkeletonConfig?.fadeOutDuration ?? 0)
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = self.viewState?.image
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: true)
    }
    
    override func fadeOut() {
        let duration = (currentSkeletonConfig?.fadeOutDuration ?? 0)
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = nil
        }, completion: nil)
        
        fadeBackgroundColor(duration: duration, fadeIn: false)
    }
}

extension SkeletonLayer {
    func fadeIn(duration:Double) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration

        contentLayer.opacity = 1
        contentLayer.add(animation, forKey: nil)
        
    }
    
    func fadeOut(_ performFade:Bool, duration:Double = 0, completion: @escaping () ->()) {
        if performFade {
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
        else {
            completion()
        }
        
    }
}


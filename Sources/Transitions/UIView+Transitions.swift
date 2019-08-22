// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit

extension CALayer {
    func insertSublayer(_ layer: SkeletonLayer, at idx: UInt32, transition: SkeletonTransitionStyle, completion: (() -> Void)? = nil) {
        insertSublayer(layer.contentLayer, at: idx)
        switch transition {
        case .none:
            break
        case .fade(let duration):
            CATransaction.begin()
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = duration
            layer.contentLayer.opacity = 1
            CATransaction.setCompletionBlock(completion)
            
            layer.contentLayer.add(animation, forKey: nil)
            CATransaction.commit()
        }
    }
}

extension UIView {
    func startTransition(prepareBlock: @escaping () -> Void) {
        guard let transitionStyle = currentSkeletonConfig?.transition,
            transitionStyle != .none
            else {
                prepareBlock()
                return
        }
        
        if case let .fade(duration) = transitionStyle {
            UIView.transition(with: self,
                              duration: duration,
                              options: .transitionCrossDissolve,
                              animations: prepareBlock,
                              completion: nil)
        }
    }
}

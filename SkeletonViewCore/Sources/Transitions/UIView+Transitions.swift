// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit

extension CALayer {
    func insertSkeletonLayer(_ sublayer: SkeletonLayer, atIndex index: UInt32, transition: SkeletonTransitionStyle, completion: (() -> Void)? = nil) {
        insertSublayer(sublayer.contentLayer, at: index)
        switch transition {
        case .none:
            completion?()
        case .crossDissolve(let duration):
            sublayer.contentLayer.setOpacity(from: 0, to: 1, duration: duration, completion: completion)
        }
    }
}

extension UIView {
    func startTransition(transitionBlock: @escaping () -> Void) {
        guard let transitionStyle = currentSkeletonConfig?.transition,
            transitionStyle != .none
            else {
                transitionBlock()
                return
        }
        
        if case let .crossDissolve(duration) = transitionStyle {
            UIView.transition(with: self,
                              duration: duration,
                              options: .transitionCrossDissolve,
                              animations: transitionBlock,
                              completion: nil)
        }
    }
}

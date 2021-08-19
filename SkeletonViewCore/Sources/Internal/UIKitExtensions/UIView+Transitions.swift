// Copyright © 2019 SkeletonView. All rights reserved.

import UIKit

extension UIView {
    
    func startTransition(transitionBlock: @escaping () -> Void) {
        guard let transitionStyle = _currentSkeletonConfig?.transition,
              transitionStyle != .none else {
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

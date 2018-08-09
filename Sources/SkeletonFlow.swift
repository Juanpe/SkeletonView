//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(withRootView rootView: UIView)
    func willBeginHidingSkeletons(withRootView rootView: UIView)
}

class SkeletonFlowHandler: SkeletonFlowDelegate {
    
    func willBeginShowingSkeletons(withRootView rootView: UIView) {
        log("☠️ => Skeleton will begin showing using as root container: \(String(describing: rootView))")
        rootView.addAppNotificationsObservers()
    }
    
    func willBeginHidingSkeletons(withRootView rootView: UIView) {
        log("☠️ => Skeleton will begin hidding using as root container: \(String(describing: rootView))")
        rootView.removeAppNoticationsObserver()
        rootView.flowDelegate = nil
    }
}

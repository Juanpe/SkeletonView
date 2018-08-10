//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(withRootView rootView: UIView)
    func willBeginHidingSkeletons(withRootView rootView: UIView)
}

class SkeletonFlowHandler: SkeletonFlowDelegate {
    
    func willBeginShowingSkeletons(withRootView rootView: UIView) {
        log("☠️ will begin showing \(rootView.skeletonHierarchy())")
        rootView.addAppNotificationsObservers()
    }
    
    func willBeginHidingSkeletons(withRootView rootView: UIView) {
        log("☠️ will begin hidding using as root container ")
        rootView.removeAppNoticationsObserver()
        rootView.flowDelegate = nil
    }
}

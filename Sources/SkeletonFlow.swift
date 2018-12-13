//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(withRootView rootView: UIView)
    func didShowSkeletons(withRootView rootView: UIView)
    func willBeginHidingSkeletons(withRootView rootView: UIView)
    func didHideSkeletons(withRootView rootView: UIView)
}

class SkeletonFlowHandler: SkeletonFlowDelegate {

    func willBeginShowingSkeletons(withRootView rootView: UIView) {
        rootView.addAppNotificationsObservers()
    }

    func didShowSkeletons(withRootView rootView: UIView) {
        printSkeletonHierarchy(in: rootView)
    }
    
    func willBeginHidingSkeletons(withRootView rootView: UIView) {
        rootView.removeAppNoticationsObserver()
    }

    func didHideSkeletons(withRootView rootView: UIView) {
        rootView.flowDelegate = nil
    }
}

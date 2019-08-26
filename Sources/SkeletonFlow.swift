//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(rootView: UIView)
    func didShowSkeletons(rootView: UIView)
    func willBeginUpdatingSkeletons(rootView: UIView)
    func didUpdateSkeletons(rootView: UIView)
    func willBeginLayingSkeletonsIfNeeded(rootView: UIView)
    func didLayoutSkeletonsIfNeeded(rootView: UIView)
    func willBeginHidingSkeletons(rootView: UIView)
    func didHideSkeletons(rootView: UIView)
}

class SkeletonFlowHandler: SkeletonFlowDelegate {
    func willBeginShowingSkeletons(rootView: UIView) {
        rootView.addAppNotificationsObservers()
    }

    func didShowSkeletons(rootView: UIView) {
        printSkeletonHierarchy(in: rootView)
    }
    
    func willBeginUpdatingSkeletons(rootView: UIView) {
    }

    func didUpdateSkeletons(rootView: UIView) {
    }

    func willBeginLayingSkeletonsIfNeeded(rootView: UIView) {
    }

    func didLayoutSkeletonsIfNeeded(rootView: UIView) {
    }

    func willBeginHidingSkeletons(rootView: UIView) {
        rootView.removeAppNoticationsObserver()
    }

    func didHideSkeletons(rootView: UIView) {
        rootView.flowDelegate = nil
    }
}

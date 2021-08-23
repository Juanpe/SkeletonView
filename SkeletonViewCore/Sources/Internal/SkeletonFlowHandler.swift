//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate: AnyObject {
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
        NotificationCenter.default.post(name: .skeletonWillAppearNotification, object: rootView, userInfo: nil)
        rootView.startObservingAppLifecycleNotifications()
    }

    func didShowSkeletons(rootView: UIView) {
        skeletonLog(rootView.sk.skeletonTreeDescription)
        NotificationCenter.default.post(name: .skeletonWillAppearNotification, object: rootView, userInfo: nil)
    }

    func willBeginUpdatingSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .skeletonWillAppearNotification, object: rootView, userInfo: nil)
    }

    func didUpdateSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .skeletonWillAppearNotification, object: rootView, userInfo: nil)
    }

    func willBeginLayingSkeletonsIfNeeded(rootView: UIView) {
    }

    func didLayoutSkeletonsIfNeeded(rootView: UIView) {
    }

    func willBeginHidingSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .skeletonWillDisappearNotification, object: rootView, userInfo: nil)
        rootView.stopObservingAppLifecycleNotications()
    }

    func didHideSkeletons(rootView: UIView) {
        rootView._flowDelegate = nil
        NotificationCenter.default.post(name: .skeletonDidDisappearNotification, object: rootView, userInfo: nil)
    }
}

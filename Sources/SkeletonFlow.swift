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
        NotificationCenter.default.post(name: .willBeginShowingSkeletons, object: rootView, userInfo: nil)
        rootView.addAppNotificationsObservers()
    }

    func didShowSkeletons(rootView: UIView) {
        printSkeletonHierarchy(in: rootView)
        NotificationCenter.default.post(name: .didShowSkeletons, object: rootView, userInfo: nil)
    }

    func willBeginUpdatingSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .willBeginUpdatingSkeletons, object: rootView, userInfo: nil)
    }

    func didUpdateSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .didUpdateSkeletons, object: rootView, userInfo: nil)
    }

    func willBeginLayingSkeletonsIfNeeded(rootView: UIView) {
    }

    func didLayoutSkeletonsIfNeeded(rootView: UIView) {
    }

    func willBeginHidingSkeletons(rootView: UIView) {
        NotificationCenter.default.post(name: .willBeginHidingSkeletons, object: rootView, userInfo: nil)
        rootView.removeAppNoticationsObserver()
    }

    func didHideSkeletons(rootView: UIView) {
        rootView.flowDelegate = nil
        NotificationCenter.default.post(name: .didHideSkeletons, object: rootView, userInfo: nil)
    }
}

public extension Notification.Name {
    static let willBeginShowingSkeletons = Notification.Name("willBeginShowingSkeletons")
    static let didShowSkeletons = Notification.Name("didShowSkeletons")
    static let willBeginUpdatingSkeletons = Notification.Name("willBeginUpdatingSkeletons")
    static let didUpdateSkeletons = Notification.Name("didUpdateSkeletons")
    static let willBeginHidingSkeletons = Notification.Name("willBeginHidingSkeletons")
    static let didHideSkeletons = Notification.Name("didHideSkeletons")
}

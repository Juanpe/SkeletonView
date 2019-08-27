//
//  UIView+UIApplicationDelegate.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 08/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    enum Constants {
        static let becomeActiveNotification = UIApplication.didBecomeActiveNotification
        static let enterForegroundNotification = UIApplication.didEnterBackgroundNotification
        static let willTerminateNotification = UIApplication.willTerminateNotification
        static let needAnimatedSkeletonKey = "needAnimateSkeleton"
    }
    
    func addAppNotificationsObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: Constants.becomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: Constants.enterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willTerminateNotification), name: Constants.enterForegroundNotification, object: nil)
    }
    
    func removeAppNoticationsObserver() {
        NotificationCenter.default.removeObserver(self, name: Constants.becomeActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: Constants.enterForegroundNotification, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        if UserDefaults.standard.bool(forKey: Constants.needAnimatedSkeletonKey) {
            startSkeletonAnimation()
        }
    }
    
    @objc func appDidEnterBackground() {
        UserDefaults.standard.set((isSkeletonActive && isSkeletonAnimated), forKey: Constants.needAnimatedSkeletonKey)
    }
    
    @objc func willTerminateNotification() {
        UserDefaults.standard.set(false, forKey: Constants.needAnimatedSkeletonKey)
    }
}

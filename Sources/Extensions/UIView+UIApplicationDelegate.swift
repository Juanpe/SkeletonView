//
//  UIView+UIApplicationDelegate.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 08/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    
    func addAppNotificationsObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    func removeAppNoticationsObserver() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        if UserDefaults.Key.needAnimatedSkeleton.boolValue {
            startSkeletonAnimation()
        }
    }
    
    @objc func appDidEnterBackground() {
        UserDefaults.standard.set((isSkeletonActive && skeletonIsAnimated), forKey: UserDefaults.Key.needAnimatedSkeleton.rawValue)
    }
}


//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+AppLifecycleNotifications.swift
//
//  Created by Juanpe Catalán on 08/02/2018.

import UIKit

extension UIView {
    
    enum Constants {
        static let needAnimatedSkeletonKey = "needAnimateSkeleton"
    }
    
    func startObservingAppLifecycleNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: .applicationDidBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: .applicationDidEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willTerminateNotification), name: .applicationWillTerminateNotification, object: nil)
    }
    
    func stopObservingAppLifecycleNotications() {
        NotificationCenter.default.removeObserver(self, name: .applicationDidBecomeActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: .applicationDidEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: .applicationWillTerminateNotification, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        if UserDefaults.standard.bool(forKey: Constants.needAnimatedSkeletonKey) {
            startSkeletonAnimation()
        }
    }
    
    @objc func appDidEnterBackground() {
        UserDefaults.standard.set((sk.isSkeletonActive && _isSkeletonAnimated), forKey: Constants.needAnimatedSkeletonKey)
    }
    
    @objc func willTerminateNotification() {
        UserDefaults.standard.set(false, forKey: Constants.needAnimatedSkeletonKey)
    }
    
}

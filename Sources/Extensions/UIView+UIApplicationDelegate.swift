//
//  UIView+UIApplicationDelegate.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 08/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

extension UIView {
    
    enum Notifications {
        static let becomeActive = NSNotification.Name.UIApplicationDidBecomeActive
        static let enterForeground = NSNotification.Name.UIApplicationDidEnterBackground
    }
    
    func addAppNotificationsObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: Notifications.becomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: Notifications.enterForeground, object: nil)
    }
    
    func removeAppNoticationsObserver() {
        NotificationCenter.default.removeObserver(self, name: Notifications.becomeActive, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notifications.enterForeground, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        
    }
    
    @objc func appDidEnterBackground() {
        
    }
}

//
//  SkeletonFlow.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 08/02/2018.
//  Copyright © 2018 SkeletonView. All rights reserved.
//

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(withRootView rootView: UIView)
    func willBeginHidingSkeletons(withRootView rootView: UIView)
}

class SkeletonFlowHandler: SkeletonFlowDelegate {
    
    func willBeginShowingSkeletons(withRootView rootView: UIView) {
        rootView.addAppNotificationsObservers()
    }
    
    func willBeginHidingSkeletons(withRootView rootView: UIView) {
        rootView.removeAppNoticationsObserver()
        rootView.flowDelegate = nil
    }
}

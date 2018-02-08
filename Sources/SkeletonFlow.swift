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
        // Add observer to application status
    }
    
    func willBeginHidingSkeletons(withRootView rootView: UIView) {
        // remove observers
        rootView.flowDelegate = nil
    }
}

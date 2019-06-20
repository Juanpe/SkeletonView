// Copyright © 2019 SkeletonView. All rights reserved.

import Foundation

// MARK: - Keys

extension UserDefaults {
    enum Key: String, CaseIterable {
        case needAnimatedSkeleton = "needAnimatedSkeleton"
        
        var boolValue: Bool {
            return UserDefaults.standard.bool(forKey: rawValue)
        }
        
        func clear() {
            UserDefaults.standard.removeObject(forKey: rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}

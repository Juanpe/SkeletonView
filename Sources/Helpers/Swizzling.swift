// Copyright © 2019 SkeletonView. All rights reserved.

import Foundation

extension DispatchQueue {
    private static var _onceTracker = [String]()

    class func once(token: String, block: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        guard !_onceTracker.contains(token) else { return }

        _onceTracker.append(token)
        block()
    }

    class func removeOnce(token: String, block: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        guard let index = _onceTracker.firstIndex(of: token) else { return }
        _onceTracker.remove(at: index)
        block()
    }
}

func swizzle(selector originalSelector: Selector, with swizzledSelector: Selector, inClass: AnyClass, usingClass: AnyClass) {
    guard let originalMethod = class_getInstanceMethod(inClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(usingClass, swizzledSelector)
        else { return }

    if class_addMethod(inClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod)) {
        class_replaceMethod(inClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

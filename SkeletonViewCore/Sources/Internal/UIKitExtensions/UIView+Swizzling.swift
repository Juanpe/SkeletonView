//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  UIView+Swizzling.swift
//
//  Created by Juanpe Catalán on 19/8/21.

import UIKit

extension UIView {

    @objc func skeletonLayoutSubviews() {
        guard Thread.isMainThread else { return }
        skeletonLayoutSubviews()
        guard sk.isSkeletonActive else { return }
        layoutSkeletonIfNeeded()
    }

    @objc func skeletonTraitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        skeletonTraitCollectionDidChange(previousTraitCollection)
        guard isSkeletonable, sk.isSkeletonActive, let config = _currentSkeletonConfig else { return }
        updateSkeleton(skeletonConfig: config)
    }
    
    func swizzleLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.once(token: "UIView.SkeletonView.swizzleLayoutSubviews") {
                swizzle(selector: #selector(UIView.layoutSubviews),
                        with: #selector(UIView.skeletonLayoutSubviews),
                        inClass: UIView.self,
                        usingClass: UIView.self)
                self.layoutSkeletonIfNeeded()
            }
        }
    }
    
    func unSwizzleLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.removeOnce(token: "UIView.SkeletonView.swizzleLayoutSubviews") {
                swizzle(selector: #selector(UIView.skeletonLayoutSubviews),
                        with: #selector(UIView.layoutSubviews),
                        inClass: UIView.self,
                        usingClass: UIView.self)
            }
        }
    }
    
    func swizzleTraitCollectionDidChange() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.once(token: "UIView.SkeletonView.swizzleTraitCollectionDidChange") {
                swizzle(selector: #selector(UIView.traitCollectionDidChange(_:)),
                        with: #selector(UIView.skeletonTraitCollectionDidChange(_:)),
                        inClass: UIView.self,
                        usingClass: UIView.self)
            }
        }
    }
    
    func unSwizzleTraitCollectionDidChange() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            DispatchQueue.removeOnce(token: "UIView.SkeletonView.swizzleTraitCollectionDidChange") {
                swizzle(selector: #selector(UIView.skeletonTraitCollectionDidChange(_:)),
                        with: #selector(UIView.traitCollectionDidChange(_:)),
                        inClass: UIView.self,
                        usingClass: UIView.self)
            }
        }
    }
    
}

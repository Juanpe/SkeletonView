//
//  ExtensionOC.swift
//  SkeletonView
//
//  Created by lionsom on 2022/7/6.
//

import Foundation

@objc public extension UIView {
    func showSkeleton_OC() {
        self.showSkeleton()
    }

    func showAnimatedSkeleton_OC() {
        self.showAnimatedSkeleton()
    }

    func showGradientSkeleton_OC() {
        self.showGradientSkeleton()
    }

    func showAnimatedGradientSkeleton_OC() {
        self.showAnimatedGradientSkeleton()
    }

    func hideSkeleton_OC() {
        self.hideSkeleton()
    }
}

@objc public extension UILabel {
    // MARK: UILabel+SKExtensions

    func skeletonPaddingInsets_OC(insets: UIEdgeInsets) {
        self.skeletonPaddingInsets = insets
    }

    // type 1:relativeToFont   2:relativeToConstraints   >2:fixed(CGFloat)
    func skeletonTextLineHeight_OC(type: Int) {
        if type == 1 {
            self.skeletonTextLineHeight = .relativeToFont
        } else if type == 2 {
            self.skeletonTextLineHeight = .relativeToConstraints
        } else {
            self.skeletonTextLineHeight = .fixed(CGFloat(type))
        }
    }

    // type 1:`inherited`   2:custom(Int)
    func skeletonTextNumberOfLines_OC(type: Int) {
        if type == 1 {
            self.skeletonTextNumberOfLines = .inherited
        } else {
            self.skeletonTextNumberOfLines = .custom(type)
        }
    }

    // MARK: UIView+SKExtensions

    func skeletonTreeDescription_OC() -> String {
        self.sk.skeletonTreeDescription
    }

    func isSkeletonActive_OC() -> Bool {
        self.sk.isSkeletonActive
    }
}

@objc public extension UITextView {
    // MARK: UITextView+SKExtensions

    func skeletonPaddingInsets_OC(insets: UIEdgeInsets) {
        self.skeletonPaddingInsets = insets
    }

    // type 1:relativeToFont   2:relativeToConstraints   >2:fixed(CGFloat)
    func skeletonTextLineHeight_OC(type: Int) {
        if type == 1 {
            self.skeletonTextLineHeight = .relativeToFont
        } else if type == 2 {
            self.skeletonTextLineHeight = .relativeToConstraints
        } else {
            self.skeletonTextLineHeight = .fixed(CGFloat(type))
        }
    }

    // type 1:`inherited`   2:custom(Int)
    func skeletonTextNumberOfLines_OC(type: Int) {
        if type == 1 {
            self.skeletonTextNumberOfLines = .inherited
        } else {
            self.skeletonTextNumberOfLines = .custom(type)
        }
    }

    // MARK: UIView+SKExtensions

    func skeletonTreeDescription_OC() -> String {
        self.sk.skeletonTreeDescription
    }

    func isSkeletonActive_OC() -> Bool {
        self.sk.isSkeletonActive
    }
}

// MARK: To Do

//
// Tips:
// if needed, extension SkeletonViewExtension where ExtendedType: UIView
//
@objc public extension UIImageView {}

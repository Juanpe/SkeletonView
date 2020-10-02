// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Object that facilitates the creation of skeleton layers for multiline
/// elements, based on the builder pattern
class SkeletonMultilineLayerBuilder {
    var skeletonType: SkeletonType?
    var index: Int?
    var height: CGFloat?
    var width: CGFloat?
    var cornerRadius: Int?
    var multilineSpacing: CGFloat = SkeletonAppearance.default.multilineSpacing
    var paddingInsets: UIEdgeInsets = .zero
    var isRTL: Bool = false

    @discardableResult
    func setSkeletonType(_ type: SkeletonType) -> SkeletonMultilineLayerBuilder {
        self.skeletonType = type
        return self
    }

    @discardableResult
    func setIndex(_ index: Int) -> SkeletonMultilineLayerBuilder {
        self.index = index
        return self
    }
    
    @discardableResult
    func setHeight(_ height: CGFloat) -> SkeletonMultilineLayerBuilder {
        self.height = height
        return self
    }
    
    @discardableResult
    func setWidth(_ width: CGFloat) -> SkeletonMultilineLayerBuilder {
        self.width = width
        return self
    }

    @discardableResult
    func setCornerRadius(_ radius: Int) -> SkeletonMultilineLayerBuilder {
        self.cornerRadius = radius
        return self
    }

    @discardableResult
    func setMultilineSpacing(_ spacing: CGFloat) -> SkeletonMultilineLayerBuilder {
        self.multilineSpacing = spacing
        return self
    }

    @discardableResult
    func setPadding(_ insets: UIEdgeInsets) -> SkeletonMultilineLayerBuilder {
        self.paddingInsets = insets
        return self
    }
    
    @discardableResult
    func setIsRTL(_ isRTL: Bool) -> SkeletonMultilineLayerBuilder {
        self.isRTL = isRTL
        return self
    }

    func build() -> CALayer? {
        guard let type = skeletonType,
              let index = index,
              let width = width,
              let height = height,
              let radius = cornerRadius
            else { return nil }

        let layer = type.layer
        layer.anchorPoint = .zero
        layer.name = CALayer.skeletonSubLayersName
        layer.updateLayerFrame(for: index,
                               size: CGSize(width: width, height: height),
                               multilineSpacing: multilineSpacing,
                               paddingInsets: paddingInsets,
                               isRTL: isRTL)

        layer.cornerRadius = CGFloat(radius)
        layer.masksToBounds = true

        return layer
    }
}

// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Object that facilitates the creation of skeleton layers for multiline
/// elements, based on the builder pattern
class SkeletonMultilineLayerBuilder {

    var skeletonType: SkeletonType?
    var index: Int?
    var width: CGFloat?
    var cornerRadius: Int?
    var eachLineHeight: CGFloat?

    func setSkeletonType(_ type: SkeletonType) -> SkeletonMultilineLayerBuilder {
        self.skeletonType = type
        return self
    }

    func setIndex(_ index: Int) -> SkeletonMultilineLayerBuilder {
        self.index = index
        return self
    }

    func setWidth(_ width: CGFloat) -> SkeletonMultilineLayerBuilder {
        self.width = width
        return self
    }

    func setCornerRadius(_ radius: Int) -> SkeletonMultilineLayerBuilder {
        self.cornerRadius = radius
        return self
    }

    func setEachLineHeight(_ eachLineHeight: CGFloat) -> SkeletonMultilineLayerBuilder {
        self.eachLineHeight = eachLineHeight
        return self
    }

    func build() -> CALayer? {
        guard let type = skeletonType,
              let index = index,
              let width = width,
              let radius = cornerRadius,
              let eachLineHeight = eachLineHeight
            else { return nil }

        let layer = type.layer
        layer.anchorPoint = .zero
        layer.name = CALayer.skeletonSubLayersName
        layer.updateLayerFrame(for: index, width: width, height: eachLineHeight)

        layer.cornerRadius = CGFloat(radius)
        layer.masksToBounds = true

        return layer
    }
}

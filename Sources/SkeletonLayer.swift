//
//  SkeletonLayer.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

final class SkeletonLayerFactory {

    static func makeLayer(withType type: SkeletonType, usingColors colors: [UIColor], andHolder holder: UIView) -> SkeletonLayer {
        return SkeletonLayer(withType: type, usingColors: colors, andSkeletonHolder: holder)
    }

    static func makeMultilineLayer(withType type: SkeletonType, for index: Int, width: Int) -> CALayer {
        let spaceRequitedForEachLine = SkeletonDefaultConfig.multilineHeight + SkeletonDefaultConfig.multilineSpacing
        let layer = type.layer
        layer.anchorPoint = .zero
        layer.name = CALayer.skeletonSubLayersName
        layer.frame = CGRect(x: 0, y: (index * spaceRequitedForEachLine), width: width, height: SkeletonDefaultConfig.multilineHeight)
        return layer
    }
}

public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation

public enum SkeletonType {
    case solid
    case gradient

    var layer: CALayer {
        switch self {
        case .solid:
            return CALayer()
        case .gradient:
            return CAGradientLayer()
        }
    }

    var layerAnimation: SkeletonLayerAnimation {
        switch self {
        case .solid:
            return { $0.pulse }
        case .gradient:
            return { $0.sliding }
        }
    }
}

public struct SkeletonLayer {

    private var maskLayer: CALayer
    private weak var holder: UIView?

    var type: SkeletonType {
        return maskLayer is CAGradientLayer ? .gradient : .solid
    }

    var contentLayer: CALayer {
        return maskLayer
    }

    init(withType type: SkeletonType, usingColors colors: [UIColor], andSkeletonHolder holder: UIView) {
        self.holder = holder
        self.maskLayer = type.layer
        self.maskLayer.anchorPoint = .zero
        self.maskLayer.bounds = holder.maxBoundsEstimated
        addMultilinesIfNeeded()
        self.maskLayer.tint(withColors: colors)
    }

    func updateLayer() {
        guard let holder = holder else { return }
        maskLayer.bounds = holder.maxBoundsEstimated
    }

    func removeLayer() {
        maskLayer.removeFromSuperlayer()
    }

    func addMultilinesIfNeeded() {
        guard let multiLineView = holder as? ContainsMultilineText else { return }
        maskLayer.addMultilinesLayers(lines: multiLineView.numLines, type: type)
    }
}

extension SkeletonLayer {

    func start(_ anim: SkeletonLayerAnimation? = nil) {
        let animation = anim ?? type.layerAnimation
        contentLayer.playAnimation(animation, key: "skeletonAnimation")
    }

    func stopAnimation() {
        contentLayer.stopAnimation(forKey: "skeletonAnimation")
    }
}

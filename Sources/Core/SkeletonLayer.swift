//
//  SkeletonLayer.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

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

struct SkeletonLayer {
    
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
    
    func removeLayer() {
        maskLayer.removeFromSuperlayer()
    }
    
    func addMultilinesIfNeeded() {
        guard let multiLineView = holder as? ContainsMultilineText else { return }
        maskLayer.addMultilinesLayers(lines: multiLineView.numLines, type: type, lastLineFillPercent: multiLineView.lastLineFillingPercent, multilineCornerRadius: multiLineView.multilineCornerRadius)
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

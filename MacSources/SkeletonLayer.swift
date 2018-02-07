//
//  SkeletonLayer.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

class SkeletonLayerFactory {
    
    func makeLayer(withType type: SkeletonType, usingColors colors: [NSColor], andHolder holder: NSView) -> SkeletonLayer {
        return SkeletonLayer(withType: type, usingColors: colors, andSkeletonHolder: holder)
    }
    
    func makeMultilineLayer(withType type: SkeletonType, for index: Int, width: CGFloat, height: CGFloat) -> CALayer {
        let spaceRequiredForEachLine = SkeletonDefaultConfig.multilineHeight + SkeletonDefaultConfig.multilineSpacing
        let layer = type.layer
        layer.anchorPoint = .zero
        layer.name = CALayer.skeletonSubLayersName
        layer.frame = CGRect(x: 0.0, y: CGFloat(index) * spaceRequiredForEachLine, width: width, height: height)
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

struct SkeletonLayer {
    
    private var maskLayer: CALayer
    private weak var holder: NSView?
    
    var type: SkeletonType {
        return maskLayer is CAGradientLayer ? .gradient : .solid
    }
    
    var contentLayer: CALayer {
        return maskLayer
    }
    
    init(withType type: SkeletonType, usingColors colors: [NSColor], andSkeletonHolder holder: NSView) {
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
        maskLayer.addMultilinesLayers(lines: multiLineView.numLines, type: type, lastLineFillPercent: multiLineView.lastLineFillingPercent, desiredLineHeight: multiLineView.desiredMultilineHeight)
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

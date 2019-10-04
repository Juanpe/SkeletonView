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
    
    init(type: SkeletonType, colors: [UIColor], skeletonHolder holder: UIView) {
        self.holder = holder
        self.maskLayer = type.layer
        self.maskLayer.anchorPoint = .zero
        self.maskLayer.bounds = holder.maxBoundsEstimated
        addLines()
        self.maskLayer.tint(withColors: colors)
    }
    
    func update(usingColors colors: [UIColor]) {
        layoutIfNeeded()
        maskLayer.tint(withColors: colors)
    }

    func layoutIfNeeded() {
        if let bounds = holder?.maxBoundsEstimated {
            maskLayer.bounds = bounds
        }
        updateLinesIfNeeded()
    }
    
    func removeLayer(transition: SkeletonTransitionStyle, completion: (() -> Void)? = nil) {
        switch transition {
        case .none:
            maskLayer.removeFromSuperlayer()
            completion?()
        case .crossDissolve(let duration):
            maskLayer.setOpacity(from: 1, to: 0, duration: duration) {
                self.maskLayer.removeFromSuperlayer()
                completion?()
            }
        }
    }

    /// Returns a multiLineViewHolder only if the current holder implements the `ContainsMultilineText` protocol,
    /// and actually displays multiple lines of text.
    private var multiLineViewHolder: ContainsMultilineText? {
        guard let multiLineView = holder as? ContainsMultilineText,
            multiLineView.numLines != 1 else { return nil }
        return multiLineView
    }

    /// If there is more than one line, or custom preferences have been set for a single line, draw custom layers
    func addLines() {
        if let multiLineView = multiLineViewHolder {
            maskLayer.addMultilinesLayers(lines: multiLineView.numLines, type: type, lastLineFillPercent: multiLineView.lastLineFillingPercent, multilineCornerRadius: multiLineView.multilineCornerRadius, multilineSpacing: multiLineView.multilineSpacing, paddingInsets: multiLineView.paddingInsets)
        } else if let singleLineView = holder as? ContainsSinglelineText, SkeletonAppearance.default.renderSingleLineAsCustom == true {
            maskLayer.addSingleLineLayers(type: type, singlelineFillPercent: singleLineView.singlelineFillingPercent, singlelineCornerRadius: singleLineView.singlelineCornerRadius, spacing: SkeletonAppearance.default.multilineSpacing)
        }
    }

    func updateLinesIfNeeded() {
        if let multiLineView = multiLineViewHolder {
            maskLayer.updateMultilinesLayers(lastLineFillPercent: multiLineView.lastLineFillingPercent, multilineSpacing: multiLineView.multilineSpacing, paddingInsets: multiLineView.paddingInsets)
        } else if let singleLineView = holder as? ContainsSinglelineText {
            maskLayer.updateMultilinesLayers(lastLineFillPercent: singleLineView.singlelineFillingPercent, multilineSpacing: SkeletonAppearance.default.multilineSpacing, paddingInsets:.zero)
        }
    }
}

extension SkeletonLayer {
    func start(_ anim: SkeletonLayerAnimation? = nil, completion: (() -> Void)? = nil) {
        let animation = anim ?? type.layerAnimation
        contentLayer.playAnimation(animation, key: "skeletonAnimation", completion: completion)
    }

    func stopAnimation() {
        contentLayer.stopAnimation(forKey: "skeletonAnimation")
    }
}

//
//  SkeletonLayer.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

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
        self.maskLayer.bounds = holder.definedMaxBounds
        self.maskLayer.cornerRadius = CGFloat(holder.skeletonCornerRadius)
        addTextLinesIfNeeded()
        self.maskLayer.tint(withColors: colors)
    }
    
    func update(usingColors colors: [UIColor]) {
        layoutIfNeeded()
        maskLayer.tint(withColors: colors)
    }

    func layoutIfNeeded() {
        if let bounds = holder?.definedMaxBounds {
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

    /// If there is more than one line, or custom preferences have been set for a single line, draw custom layers
    func addTextLinesIfNeeded() {
        guard let textView = holderAsTextView else { return }
        let config = SkeletonMultilinesLayerConfig(lines: textView.estimatedNumberOfLines,
                                                   lineHeight: textView.estimatedLineHeight,
                                                   type: type,
                                                   lastLineFillPercent: textView.lastLineFillingPercent,
                                                   multilineCornerRadius: textView.multilineCornerRadius,
                                                   multilineSpacing: textView.multilineSpacing,
                                                   paddingInsets: textView.paddingInsets,
                                                   alignment: textView.textAlignment,
                                                   isRTL: holder?.isRTL ?? false,
                                                   shouldCenterVertically: textView.shouldCenterTextVertically)

        maskLayer.addMultilinesLayers(for: config)
    }
    
    func updateLinesIfNeeded() {
        guard let textView = holderAsTextView else { return }
        let config = SkeletonMultilinesLayerConfig(lines: textView.estimatedNumberOfLines,
                                                   lineHeight: textView.estimatedLineHeight,
                                                   type: type,
                                                   lastLineFillPercent: textView.lastLineFillingPercent,
                                                   multilineCornerRadius: textView.multilineCornerRadius,
                                                   multilineSpacing: textView.multilineSpacing,
                                                   paddingInsets: textView.paddingInsets,
                                                   alignment: textView.textAlignment,
                                                   isRTL: holder?.isRTL ?? false,
                                                   shouldCenterVertically: textView.shouldCenterTextVertically)
        
        maskLayer.updateMultilinesLayers(for: config)
    }
    
    var holderAsTextView: SkeletonTextNode? {
        guard let textView = holder as? SkeletonTextNode,
            (textView.estimatedNumberOfLines == -1 || textView.estimatedNumberOfLines == 0 || textView.estimatedNumberOfLines > 1 || textView.estimatedNumberOfLines == 1 && !SkeletonAppearance.default.renderSingleLineAsView) else {
                return nil
        }
        return textView
    }
    
}

extension SkeletonLayer {
    
    func start(_ anim: SkeletonLayerAnimation? = nil, completion: (() -> Void)? = nil) {
        let animation = anim ?? type.defaultLayerAnimation(isRTL: holder?.isRTL ?? false)
        contentLayer.playAnimation(animation, key: "skeletonAnimation", completion: completion)
    }

    func stopAnimation() {
        contentLayer.stopAnimation(forKey: "skeletonAnimation")
    }
    
}

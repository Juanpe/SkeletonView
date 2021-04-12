//
//  SkeletonLayer+Animations.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 03/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

extension CALayer {
    @objc func tint(withColors colors: [UIColor]) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            backgroundColor = colors.first?.cgColor
        }) {
            $0.tint(withColors: colors)
        }
    }
}

extension CAGradientLayer {
    override func tint(withColors colors: [UIColor]) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            self.colors = colors.map { $0.cgColor }
        }) {
            $0.tint(withColors: colors)
        }
    }
}

struct SkeletonMultilinesLayerConfig {
	var lines: Int
	var lineHeight: CGFloat
	var type: SkeletonType
	var lastLineFillPercent: Int
	var multilineCornerRadius: Int
	var multilineSpacing: CGFloat
	var paddingInsets: UIEdgeInsets
    var isRTL: Bool
    
    /// Returns padding insets taking into account if the RTL is activated
    var calculatedPaddingInsets: UIEdgeInsets {
        UIEdgeInsets(top: paddingInsets.top,
                     left: isRTL ? paddingInsets.right : paddingInsets.left,
                     bottom: paddingInsets.bottom,
                     right: isRTL ? paddingInsets.left : paddingInsets.right)
    }
}

// MARK: Skeleton sublayers
extension CALayer {
    static let skeletonSubLayersName = "SkeletonSubLayersName"

    var skeletonSublayers: [CALayer] {
        return sublayers?.filter { $0.name == CALayer.skeletonSubLayersName } ?? [CALayer]()
    }
    
	func addMultilinesLayers(for config: SkeletonMultilinesLayerConfig) {
        let numberOfSublayers = config.lines > 0 ? config.lines : calculateNumLines(for: config)
        var height = config.lineHeight
        
        if numberOfSublayers == 1 && SkeletonAppearance.default.renderSingleLineAsView {
            height = bounds.height
        }

        let layerBuilder = SkeletonMultilineLayerBuilder()
			.setSkeletonType(config.type)
			.setCornerRadius(config.multilineCornerRadius)
			.setMultilineSpacing(config.multilineSpacing)
            .setPadding(config.paddingInsets)
            .setHeight(height)
            .setIsRTL(config.isRTL)
    
        (0..<numberOfSublayers).forEach { index in
			let width = calculatedWidthForLine(at: index, totalLines: numberOfSublayers, lastLineFillPercent: config.lastLineFillPercent, paddingInsets: config.paddingInsets)
            if let layer = layerBuilder
                .setIndex(index)
                .setWidth(width)
                .build() {
                addSublayer(layer)
            }
        }
    }

    func updateMultilinesLayers(for config: SkeletonMultilinesLayerConfig) {
        let currentSkeletonSublayers = skeletonSublayers
        let numberOfSublayers = currentSkeletonSublayers.count
        let lastLineFillPercent = config.lastLineFillPercent
        let paddingInsets = config.calculatedPaddingInsets
        let multilineSpacing = config.multilineSpacing
        var height = config.lineHeight
        
        if numberOfSublayers == 1 && SkeletonAppearance.default.renderSingleLineAsView {
            height = bounds.height
        }
        
        for (index, layer) in currentSkeletonSublayers.enumerated() {
            let width = calculatedWidthForLine(at: index, totalLines: numberOfSublayers, lastLineFillPercent: lastLineFillPercent, paddingInsets: paddingInsets)
            layer.updateLayerFrame(for: index,
                                   size: CGSize(width: width, height: height),
                                   multilineSpacing: multilineSpacing,
                                   paddingInsets: paddingInsets,
                                   isRTL: config.isRTL)
        }
    }

    private func calculatedWidthForLine(at index: Int, totalLines: Int, lastLineFillPercent: Int, paddingInsets: UIEdgeInsets) -> CGFloat {
        var width = bounds.width - paddingInsets.left - paddingInsets.right
        if index == totalLines - 1 && totalLines != 1 {
            width = width * CGFloat(lastLineFillPercent) / 100
        }
        return width
    }

    func updateLayerFrame(for index: Int, size: CGSize, multilineSpacing: CGFloat, paddingInsets: UIEdgeInsets, isRTL: Bool) {
        let spaceRequiredForEachLine = size.height + multilineSpacing
        let newFrame = CGRect(x: paddingInsets.left,
                              y: CGFloat(index) * spaceRequiredForEachLine + paddingInsets.top,
                              width: size.width,
                              height: size.height)
        
        frame = flipRectForRTLIfNeeded(newFrame, isRTL: isRTL)
    }
    
    private func calculateNumLines(for config: SkeletonMultilinesLayerConfig) -> Int {
        let definedNumberOfLines = config.lines
        let requiredSpaceForEachLine = config.lineHeight + config.multilineSpacing
        let neededLines = round(CGFloat(bounds.height - config.paddingInsets.top - config.paddingInsets.bottom) / CGFloat(requiredSpaceForEachLine))
        guard neededLines.isNormal else {
            return 0
        }

        let calculatedNumberOfLines = Int(neededLines)
        guard calculatedNumberOfLines > 0 else {
            return 1
        }
        
        if definedNumberOfLines > 0, definedNumberOfLines <= calculatedNumberOfLines {
            return definedNumberOfLines
        }
        
        return calculatedNumberOfLines
    }
    
    private func flipRectForRTLIfNeeded(_ rect: CGRect, isRTL: Bool) -> CGRect {
        var newRect = rect
        if isRTL {
            newRect.origin.x = (superlayer?.bounds.width ?? 0) - rect.origin.x - rect.width
        }
        return newRect
    }
}

// MARK: Animations
public extension CALayer {
    var pulse: CAAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = backgroundColor
        
        // swiftlint:disable:next force_unwrapping
        pulseAnimation.toValue = UIColor(cgColor: backgroundColor!).complementaryColor.cgColor
        pulseAnimation.duration = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        pulseAnimation.isRemovedOnCompletion = false
        return pulseAnimation
    }
    
    func playAnimation(_ anim: SkeletonLayerAnimation, key: String, completion: (() -> Void)? = nil) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            DispatchQueue.main.async { CATransaction.begin() }
            DispatchQueue.main.async { CATransaction.setCompletionBlock(completion) }
            add(anim(self), forKey: key)
            DispatchQueue.main.async { CATransaction.commit() }
        }) {
            $0.playAnimation(anim, key: key, completion: completion)
        }
    }
    
    func stopAnimation(forKey key: String) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            removeAnimation(forKey: key)
        }) {
            $0.stopAnimation(forKey: key)
        }
    }
}

extension CALayer {
    func setOpacity(from: Int, to: Int, duration: TimeInterval, completion: (() -> Void)?) {
        DispatchQueue.main.async { CATransaction.begin() }
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        DispatchQueue.main.async { CATransaction.setCompletionBlock(completion) }
        add(animation, forKey: "setOpacityAnimation")
        DispatchQueue.main.async { CATransaction.commit() }
    }
}

//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  CALayer+Tint.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import UIKit

extension CAGradientLayer {
    
    override func tint(withColors colors: [UIColor]) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            self.colors = colors.map { $0.cgColor }
        }) {
            $0.tint(withColors: colors)
        }
    }
    
}

extension CALayer {
    
    enum Constants {
        static let skeletonSubLayersName = "SkeletonSubLayersName"
    }
    
    var skeletonSublayers: [CALayer] {
        return sublayers?.filter { $0.name == Constants.skeletonSubLayersName } ?? [CALayer]()
    }
    
    @objc func tint(withColors colors: [UIColor]) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            backgroundColor = colors.first?.cgColor
        }) {
            $0.tint(withColors: colors)
        }
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
    
    func insertSkeletonLayer(_ sublayer: SkeletonLayer, atIndex index: UInt32, transition: SkeletonTransitionStyle, completion: (() -> Void)? = nil) {
        insertSublayer(sublayer.contentLayer, at: index)
        switch transition {
        case .none:
            DispatchQueue.main.async { completion?() }
        case .crossDissolve(let duration):
            sublayer.contentLayer.setOpacity(from: 0, to: 1, duration: duration, completion: completion)
        }
    }
    
}

private extension CALayer {
    
    func alignLayerFrame(_ rect: CGRect, paddingInsets: UIEdgeInsets, alignment: NSTextAlignment, isRTL: Bool) -> CGRect {
        var newRect = rect
        let superlayerWidth = (superlayer?.bounds.width ?? 0)

        switch alignment {
        case .natural where isRTL,
             .right:
            newRect.origin.x = superlayerWidth - rect.width - paddingInsets.right
        case .center:
            newRect.origin.x = (superlayerWidth + paddingInsets.left - paddingInsets.right - rect.width) / 2
        case .natural, .left, .justified:
            break
        @unknown default:
            break
        }

        return newRect
    }
    
    func calculatedWidthForLine(at index: Int, totalLines: Int, lastLineFillPercent: Int, paddingInsets: UIEdgeInsets) -> CGFloat {
        var width = bounds.width - paddingInsets.left - paddingInsets.right
        if index == totalLines - 1 {
            width = width * CGFloat(lastLineFillPercent) / 100
        }
        return width
    }
 
    func calculateNumLines(for config: SkeletonMultilinesLayerConfig) -> Int {
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
}

extension CALayer {
    
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
            .setAlignment(config.alignment)
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
                                   totalLines: numberOfSublayers,
                                   size: CGSize(width: width, height: height),
                                   multilineSpacing: multilineSpacing,
                                   paddingInsets: paddingInsets,
                                   alignment: config.alignment,
                                   isRTL: config.isRTL
            )
        }
        
        guard config.shouldCenterVertically,
              let maxY = currentSkeletonSublayers.last?.frame.maxY else {
            return
        }
        let verticallyCenterAlignedFrames = currentSkeletonSublayers.map { layer -> CGRect in
            let moveDownBy = (bounds.height - (maxY + paddingInsets.top + paddingInsets.bottom)) / 2
            return layer.frame.offsetBy(dx: 0, dy: moveDownBy)
        }
        
        for (index, layer) in currentSkeletonSublayers.enumerated() {
            layer.frame = verticallyCenterAlignedFrames[index]
        }
    }

    func updateLayerFrame(for index: Int, totalLines: Int, size: CGSize, multilineSpacing: CGFloat, paddingInsets: UIEdgeInsets, alignment: NSTextAlignment, isRTL: Bool) {
        let spaceRequiredForEachLine = size.height + multilineSpacing
        let newFrame = CGRect(x: paddingInsets.left,
                              y: CGFloat(index) * spaceRequiredForEachLine + paddingInsets.top,
                              width: size.width,
                              height: size.height)

        if index == totalLines - 1 {
            frame = alignLayerFrame(newFrame, paddingInsets: paddingInsets, alignment: alignment, isRTL: isRTL)
        } else {
            frame = newFrame
        }
    }
    
}

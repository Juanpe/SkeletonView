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


// MARK: Skeleton sublayers
extension CALayer {
    
    static let skeletonSubLayersName = "SkeletonSubLayersName"

    var skeletonSublayers: [CALayer] {
        return sublayers?.filter { $0.name == CALayer.skeletonSubLayersName } ?? [CALayer]()
    }
    
    func addMultilinesLayers(lines: Int, type: SkeletonType, lastLineFillPercent: Int, multilineCornerRadius: Int) {
        let numberOfSublayers = calculateNumLines(maxLines: lines)
        let layerBuilder = SkeletonMultilineLayerBuilder()
            .setSkeletonType(type)
            .setCornerRadius(multilineCornerRadius)

        (0..<numberOfSublayers).forEach { index in
            let width = getLineWidth(index: index, numberOfSublayers: numberOfSublayers, lastLineFillPercent: lastLineFillPercent)
            if let layer = layerBuilder
                .setIndex(index)
                .setWidth(width)
                .build() {
                addSublayer(layer)
            }
        }
    }
    
    func updateMultilinesLayers(lastLineFillPercent: Int) {
        let currentSkeletonSublayers = skeletonSublayers
        let numberOfSublayers = currentSkeletonSublayers.count
        for (index, layer) in currentSkeletonSublayers.enumerated() {
            let width = getLineWidth(index: index, numberOfSublayers: numberOfSublayers, lastLineFillPercent: lastLineFillPercent)
            layer.updateLineLayerFrame(for: index, width: width)
        }
    }

    private func getLineWidth(index: Int, numberOfSublayers: Int, lastLineFillPercent: Int) -> CGFloat {
        var width = bounds.width
        if index == numberOfSublayers - 1 && numberOfSublayers != 1 {
            width = width * CGFloat(lastLineFillPercent) / 100;
        }

        return width
    }

    private func calculateNumLines(maxLines: Int) -> Int {
        let spaceRequitedForEachLine = SkeletonAppearance.default.multilineHeight + SkeletonAppearance.default.multilineSpacing
        var numberOfSublayers = Int(round(CGFloat(bounds.height)/CGFloat(spaceRequitedForEachLine)))
        if maxLines != 0,  maxLines <= numberOfSublayers { numberOfSublayers = maxLines }
        return numberOfSublayers
    }

    internal func updateLineLayerFrame(for index: Int, width: CGFloat) {
        let spaceRequiredForEachLine = SkeletonAppearance.default.multilineHeight + SkeletonAppearance.default.multilineSpacing
        frame = CGRect(x: 0.0, y: CGFloat(index) * spaceRequiredForEachLine, width: width, height: SkeletonAppearance.default.multilineHeight)
    }
}

// MARK: Animations
public extension CALayer {

    var pulse: CAAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = backgroundColor
        pulseAnimation.toValue = UIColor(cgColor: backgroundColor!).complementaryColor.cgColor
        pulseAnimation.duration = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        return pulseAnimation
    }
    
    var sliding: CAAnimation {
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = CGPoint(x: -1, y: 0.5)
        startPointAnim.toValue = CGPoint(x:1, y: 0.5)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = CGPoint(x: 0, y: 0.5)
        endPointAnim.toValue = CGPoint(x:2, y: 0.5)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1.5
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animGroup.repeatCount = .infinity
        
        return animGroup
    }
    
    func playAnimation(_ anim: SkeletonLayerAnimation, key: String) {
        skeletonSublayers.recursiveSearch(leafBlock: {
            add(anim(self), forKey: key)
        }) {
            $0.playAnimation(anim, key: key)
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

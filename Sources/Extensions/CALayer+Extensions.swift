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
        recursiveSearch(inArray: skeletonSublayers,
                        leafBlock: { backgroundColor = colors.first?.cgColor }) {
                            $0.tint(withColors: colors)
        }
    }
}

extension CAGradientLayer {
    override func tint(withColors colors: [UIColor]) {
        recursiveSearch(inArray: skeletonSublayers,
                        leafBlock: { self.colors = colors.map { $0.cgColor } }) {
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
    
    func addMultilinesLayers(lines: Int, type: SkeletonType, lastLineFillPercent: Int) {
        let numberOfSublayers = calculateNumLines(maxLines: lines)
        for index in 0..<numberOfSublayers {
            var width = bounds.width
            
            if index == numberOfSublayers-1 && numberOfSublayers != 1 {
                width = width * CGFloat(lastLineFillPercent)/100;
            }
            
            let layer = SkeletonLayerFactory().makeMultilineLayer(withType: type, for: index, width: width)
            addSublayer(layer)
        }
    }
    
    private func calculateNumLines(maxLines: Int) -> Int {
        let spaceRequitedForEachLine = SkeletonDefaultConfig.multilineHeight + SkeletonDefaultConfig.multilineSpacing
        var numberOfSublayers = Int(round(CGFloat(bounds.height)/CGFloat(spaceRequitedForEachLine)))
        if maxLines != 0,  maxLines <= numberOfSublayers { numberOfSublayers = maxLines }
        return numberOfSublayers
    }
}

// MARK: Animations
public extension CALayer {

    var pulse: CAAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = backgroundColor
        pulseAnimation.toValue = UIColor(cgColor: backgroundColor!).complementaryColor.cgColor
        pulseAnimation.duration = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
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
        animGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animGroup.repeatCount = .infinity
        
        return animGroup
    }
    
    func playAnimation(_ anim: SkeletonLayerAnimation, key: String) {
        recursiveSearch(inArray: skeletonSublayers,
                        leafBlock: { add(anim(self), forKey: key) }) {
                            $0.playAnimation(anim, key: key)
        }
    }
    
    func stopAnimation(forKey key: String) {
        recursiveSearch(inArray: skeletonSublayers,
                        leafBlock: { removeAnimation(forKey: key) }) {
                            $0.stopAnimation(forKey: key)
        }
    }
}

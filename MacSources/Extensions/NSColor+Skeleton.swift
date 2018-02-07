//
//  NSColor+Skeleton.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//
import AppKit

extension NSColor {
    
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func isLight() -> Bool {
        // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        guard let components = cgColor.components,
              components.count >= 3 else { return false }
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return !(brightness < 0.5)
    }
    
    public var complementaryColor: NSColor {
        return isLight() ? darker : lighter
    }
    
    public var lighter: NSColor {
        return adjust(by: 1.35)
    }
    
    public var darker: NSColor {
        return adjust(by: 0.94)
    }
    
    func adjust(by percent: CGFloat) -> NSColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return NSColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }
    
    func makeGradient() -> [NSColor] {
        return [self, self.complementaryColor, self]
    }
}


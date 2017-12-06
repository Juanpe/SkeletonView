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

public extension NSColor {
    static var greenSea     = NSColor(0x16a085)
    static var turquoise    = NSColor(0x1abc9c)
    static var emerald      = NSColor(0x2ecc71)
    static var peterRiver   = NSColor(0x3498db)
    static var amethyst     = NSColor(0x9b59b6)
    static var wetAsphalt   = NSColor(0x34495e)
    static var nephritis    = NSColor(0x27ae60)
    static var belizeHole   = NSColor(0x2980b9)
    static var wisteria     = NSColor(0x8e44ad)
    static var midnightBlue = NSColor(0x2c3e50)
    static var sunFlower    = NSColor(0xf1c40f)
    static var carrot       = NSColor(0xe67e22)
    static var alizarin     = NSColor(0xe74c3c)
    static var clouds       = NSColor(0xecf0f1)
    static var concrete     = NSColor(0x95a5a6)
    static var flatOrange   = NSColor(0xf39c12)
    static var pumpkin      = NSColor(0xd35400)
    static var pomegranate  = NSColor(0xc0392b)
    static var silver       = NSColor(0xbdc3c7)
    static var asbestos     = NSColor(0x7f8c8d)
}


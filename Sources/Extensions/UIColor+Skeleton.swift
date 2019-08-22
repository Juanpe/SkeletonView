//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

// codebeat:disable[TOO_MANY_IVARS]
extension UIColor {
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func isLight() -> Bool {
        guard let components = cgColor.components,
            components.count >= 3 else { return false }
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return !(brightness < 0.5)
    }
    
    public var complementaryColor: UIColor {
        return isLight() ? darker : lighter
    }
    
    public var lighter: UIColor {
        return adjust(by: 1.35)
    }
    
    public var darker: UIColor {
        return adjust(by: 0.94)
    }
    
    func adjust(by percent: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }
    
    func makeGradient() -> [UIColor] {
        return [self, self.complementaryColor, self]
    }
}

public extension UIColor {
    static var greenSea     = UIColor(0x16a085)
    static var turquoise    = UIColor(0x1abc9c)
    static var emerald      = UIColor(0x2ecc71)
    static var peterRiver   = UIColor(0x3498db)
    static var amethyst     = UIColor(0x9b59b6)
    static var wetAsphalt   = UIColor(0x34495e)
    static var nephritis    = UIColor(0x27ae60)
    static var belizeHole   = UIColor(0x2980b9)
    static var wisteria     = UIColor(0x8e44ad)
    static var midnightBlue = UIColor(0x2c3e50)
    static var sunFlower    = UIColor(0xf1c40f)
    static var carrot       = UIColor(0xe67e22)
    static var alizarin     = UIColor(0xe74c3c)
    static var clouds       = UIColor(0xecf0f1)
    static var concrete     = UIColor(0x95a5a6)
    static var flatOrange   = UIColor(0xf39c12)
    static var pumpkin      = UIColor(0xd35400)
    static var pomegranate  = UIColor(0xc0392b)
    static var silver       = UIColor(0xbdc3c7)
    static var asbestos     = UIColor(0x7f8c8d)
}
// codebeat:enable[TOO_MANY_IVARS]

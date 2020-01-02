//
//  UIColorExtension.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func getColor (_ colorName:String) -> UIColor {
        if let path = Bundle.main.path(forResource: "colors", ofType: "plist") {
            if let myDict = NSDictionary(contentsOfFile: path) as? Dictionary<String, String> {
                return UIColor.colorWithHexString(hexString: myDict[colorName]!)
            }
        }
        return UIColor()
    }
    static func primaryColor() -> UIColor {
        return getColor("primary")
    }
    static func fbButtonColor() -> UIColor {
        return getColor("facebook")
    }
    static func gmailButtonBorderColor() -> CGColor {
        return getColor("gmailbuttonBorder").cgColor
    }
    static func signInButtonColor() -> UIColor {
        return getColor("redButtonLofo")
    }
    static func emailTextColor() -> UIColor {
        return getColor("email")
    }
    static func passwordTextColor() -> UIColor {
        return getColor("password")
    }
    static func colorWithHexString(hexString: String, alpha:CGFloat = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0

        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}

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
                return UIColor(named: myDict[colorName]!)!
            }
        }
        return UIColor()
    }
    static func primaryColor() -> UIColor {
        return getColor("primary")
    }
}

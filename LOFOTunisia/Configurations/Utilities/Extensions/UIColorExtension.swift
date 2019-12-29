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
    static func getColor (_ colorName:String)->UIColor{
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "colors", ofType: "plist") {
        myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            return UIColor(named: dict.value(forKey: colorName) as! String)!
        }
        return UIColor()
    }
    static func primaryColor()->UIColor{
        return getColor("primary")
    }
}


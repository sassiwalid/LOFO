//
//  CustomButton.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/1/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit

@IBDesignable  class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        addBorderWidth(value: borderWidth)
    }
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    func addBorderWidth(value: CGFloat) {
        layer.borderWidth = value
    }
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            addBorderWidth(value: borderWidth)
        }
    }
}

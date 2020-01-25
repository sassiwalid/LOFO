//
//  EllipseView.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/4/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit

@IBDesignable  class EllipseView: UIImageView {
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
    }
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
}

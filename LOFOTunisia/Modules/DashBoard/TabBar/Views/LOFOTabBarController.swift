//
//  LOFOTabBarController.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/18/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit

class LOFOTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
         super.viewDidLoad()
         setupMiddleButton()
         self.delegate = self
    }
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        let addLostBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        //STYLE THE BUTTON YOUR OWN WAY
        addLostBtn.setImage(UIImage(contentsOfFile: "addLostIcon"), for: .normal)
        //add to the tabbar and add click event
        self.tabBar.addSubview(addLostBtn)
        addLostBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
    }

}

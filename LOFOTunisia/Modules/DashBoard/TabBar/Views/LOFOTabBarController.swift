//
//  LOFOTabBarController.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/26/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class LOFOTabBarController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tabBarView: LOFOTabBar!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons : [UIButton]!
    // MARK: - Global Variables
    var homeViewController: HomeListViewController!
    var searchViewController: SearchViewController!
    var chatViewController: ChatViewController!
    var notificationsViewController: NotificationsViewController!
    var addLostViewController: AddLostViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }
    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true
        let selectedVC = viewControllers[selectedIndex]
        addChild(selectedVC)
        selectedVC.view.frame = contentView.bounds
        contentView.addSubview(selectedVC.view)
        selectedVC.didMove(toParent: self)
    }
    func setupColor() {
        tabBarView.backgroundColor = UIColor.tabBarColor()
        buttons[2].imageView?.layer.cornerRadius = buttons[2].frame.height * 0.50
        buttons[2].imageView?.layer.borderWidth = 10
        buttons[2].imageView?.layer.borderColor = UIColor.primaryColor().cgColor
        tabBarView.alpha = 0.9
    }
}

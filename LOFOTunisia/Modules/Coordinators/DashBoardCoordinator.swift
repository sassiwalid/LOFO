//
//  DashBoardCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/12/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class DashBoardCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    override func start() {
    let mainVC = HomeListViewController(nibName: "HomeListViewController", bundle: nil)
    mainVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "HomeIcon"), selectedImage: UIImage(named: "HomeIconSelected"))
    let chatVC = ChatViewController(nibName: "ChatViewController", bundle: nil)
    chatVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "MessagesIcon"), selectedImage: UIImage(named: "MessagesIconSelected"))
    let addLostVC = AddLostViewController(nibName: "AddLostViewController", bundle: nil)
    let notifVC = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
    notifVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "NotificationsIcon"), selectedImage: UIImage(named: "NotificationsIconSelected"))
    let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
    searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "SearchIcon"), selectedImage: UIImage(named: "SearchIconSelected"))
    let tabBarController = LOFOTabBarController(nibName: "LOFOTabBarController", bundle: nil)
    tabBarController.viewControllers = [mainVC, chatVC, addLostVC, notifVC, searchVC]
    tabBarController.selectedViewController = mainVC
    tabBarController.selectedIndex = 0
    self.navigationController.pushViewController(tabBarController, animated: true)
    }
}

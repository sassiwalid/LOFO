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
    let chatVC = ChatViewController(nibName: "ChatViewController", bundle: nil)
    let addLostVC = AddLostViewController(nibName: "AddLostViewController", bundle: nil)
    let notifVC = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
    let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
    let tabBarController = LOFOTabBarController(nibName: "LOFOTabBarController", bundle: nil)
    // associate the viewControllers with the LOFOTabbar
    tabBarController.viewControllers = [mainVC, chatVC, addLostVC, notifVC, searchVC]
    self.navigationController.pushViewController(tabBarController, animated: true)
    }
}

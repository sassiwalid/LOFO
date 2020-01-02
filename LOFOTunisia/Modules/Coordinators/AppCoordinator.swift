//
//  AppCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
class APPCoordinator:BaseCoordinator{
    var window : UIWindow?
    init(window:UIWindow) {
        self.window = window
    }
    override func start() {
        self.navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        // start Sign Coordinator
        let coordinator = SignInCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

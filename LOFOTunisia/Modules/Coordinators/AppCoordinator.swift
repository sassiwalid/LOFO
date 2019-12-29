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
class APPCoordinator:CoordinatorProtocol{
    var navigationController = UINavigationController()
    var window:UIWindow?
    init(window:UIWindow) {
        self.window = window
    }
    func start() {
        self.navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        self.showSignIn()
    }
    
    func showSignIn(){
        let signVC = SignInViewController(nibName: "SignInViewController", bundle: nil)
        self.navigationController.viewControllers = [signVC]
    }
    
    
    
}

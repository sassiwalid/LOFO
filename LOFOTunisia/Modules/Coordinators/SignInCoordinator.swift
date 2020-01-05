//
//  SignInCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/2/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SignInCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    override func start() {
        let signInVC = SignInViewController(nibName: "SignInViewController", bundle: nil)
        let viewModel = SignInViewModel(authentification: LoginAPIService(urlSession: URLSession()))
        signInVC.viewModel = viewModel
        // Coordinator subscribes to events and notifies parentCoordinator
        viewModel.didSignIn
        .bind(onNext: { (change) in
            if change == true {
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.didSignIn()
            }
        })
        .disposed(by: self.disposeBag)
        // Handle open Sign UP Coordinator from the Sign IN Coordinator
        viewModel.shouldOpenSignUP
            .bind(onNext: { (open) in
                if open == true {
                    self.showSignUp()
                }
        }).disposed(by: disposeBag)
        // else it should open the signIn VC
        self.navigationController.pushViewController(signInVC, animated: true)
    }
    func showSignUp() {
        let signUpCoordinator = SignUpCoordinator()
        signUpCoordinator.navigationController = self.navigationController
        self.start(coordinator: signUpCoordinator)
    }
}

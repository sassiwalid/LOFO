//
//  SignUpCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/4/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SignUpCoordinator:BaseCoordinator {
    private var disposeBag = DisposeBag()
    override func start() {
        let signUpVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        // Instanciate the view Model
        let viewModel = SignUpViewModel(authentification: LoginAPIService(urlSession: URLSession.shared))
        signUpVC.viewModel = viewModel
        // Handle navigation call backs
        // When user Sign Up succesfully
        viewModel.didSignUp
            .bind(onNext: { (change) in
                if change == true {
                    DispatchQueue.main.async {
                        self.navigationController.popViewController(animated: true)
                        self.parentCoordinator?.didFinish(coordinator: self)
                    }
                }
            }).disposed(by: disposeBag)
        self.navigationController.pushViewController(signUpVC, animated: true)
    }
}

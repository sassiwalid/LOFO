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
        self.navigationController.pushViewController(signUpVC, animated: true)
    }
}

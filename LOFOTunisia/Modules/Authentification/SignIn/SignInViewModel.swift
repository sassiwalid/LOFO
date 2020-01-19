//
//  SignInViewModel.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class SignInViewModel {
    // MARK: - Variables
    private let authentification : AuthAPIService?
    // Email and Password
    var email =  BehaviorRelay(value: "")
    var password = BehaviorRelay(value: "")
    // Submit
    var canSubmit = BehaviorRelay(value: false)
    // Events
    var didSignIn = BehaviorRelay(value: false)
    var didFailSignIn = BehaviorRelay(value: false)
    var shouldOpenSignUP = BehaviorRelay(value: false)
    init (authentification: AuthAPIService) {
        self.authentification = authentification
    }
    // MARK: - Check Sign In
    /// Check user signIn
    func submit() {
        authentification?.getUser(login: email.value, password: password.value, onCompletion: { (success, user) in
//                if success == true {
                    self.didSignIn.accept(true)
//                } else {
//                    self.didFailSignIn.accept(true)
//                }
        })
    }
    func openSignUp() {
        shouldOpenSignUP.accept(true)
    }
}

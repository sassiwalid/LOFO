//
//  SignUpViewModel.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/4/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SignUpViewModel {
    // MARK: - Variables
    var name =  BehaviorRelay(value: "")
    var subName = BehaviorRelay(value: "")
    var age = BehaviorRelay(value: "")
    var city = BehaviorRelay(value: "")
    var email = BehaviorRelay(value: "")
    var password = BehaviorRelay(value: "")
    var confirmedPassword = BehaviorRelay(value: "")
    var didSignUp = BehaviorRelay(value: false)
    var didFailSignUp = BehaviorRelay(value: false)
    var user = BehaviorRelay(value: User())
    // API service instance
    private let authentification: AuthAPIService?
    init (authentification: AuthAPIService) {
        self.authentification = authentification
    }
    // MARK: - Events
    func submit() {
        // First encapsulate the attributs in User instance
        createUser()
        authentification?.registerUser(user: self.user.value, onCompletion: { (success, user) in
            if success && user != nil {
                self.didSignUp.accept(true)
            }
        })
    }
    func createUser() {
        self.user.value.name = name.value
        self.user.value.subName = subName.value
        self.user.value.city = city.value
        self.user.value.age = Int(age.value)
        self.user.value.email = email.value
        self.user.value.password = password.value
    }
    func validate() -> Bool {
        return true
    }
    func chooseProfilPhoto() {
    }
}

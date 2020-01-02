//
//  SignInViewModel.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

protocol SignInViewModel {
    // Email and Password
    var email: String {get set}
    var password: String {get set}
    // Submit
    var canSubmit: Bool { get }
    func submit()
    // Errors
    var errorMessage: String { get }
}

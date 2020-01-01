//
//  APIServiceProtocol.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

protocol LoginAPIServiceProtocol {
    func getUser(login:String, password:String, onCompletion: @escaping((Bool, User) -> Void))
}

//
//  LoginAPIService.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

/// LoginAPIService:
class LoginAPIService:LoginAPIServiceProtocol {
    var urlSession : URLSession?
    init(urlSession:URLSession) {
        self.urlSession = urlSession
    }
    /// check if user exist true or false
    /// - Parameters:
    ///   - login: user login
    ///   - password: user password
    ///   - onCompletion: return success  = true and User data else false and nil
    func getUser( login:String, password:String, onCompletion:@escaping((Bool, User?) -> Void)) {
        let userUrl = URL(string:"\(Constantes.baseURL)\(Constantes.usersRoutes)")
        var request = URLRequest(url: userUrl!)
        request.httpMethod = "GET"
        onCompletion(true,User())
        //
    }
}

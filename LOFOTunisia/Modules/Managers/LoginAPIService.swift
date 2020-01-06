//
//  LoginAPIService.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

/// LoginAPIService:
class LoginAPIService: AuthAPIService {
    var urlSession : URLSession?
    init(urlSession:URLSession) {
        self.urlSession = urlSession
    }
    /// check if user exist true or false
    /// - Parameters:
    ///   - login: user email
    ///   - password: user password
    ///   - onCompletion: return success  = true and User data else false and nil
    func getUser(login: String, password: String, onCompletion: @escaping((Bool, User?) -> Void)) {
    if login.isEmpty && password.isEmpty {
            onCompletion(false, nil)
            return
    }
    let userUrl = URL(string: "\(Constantes.baseURL)\(Constantes.usersRoutes)")
    var request = URLRequest(url: userUrl!)
    request.httpMethod = "GET"
    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    let registerUserDic: [String : Any] = ["email":login, "password":password]
    guard let httpBody = try? JSONSerialization.data(withJSONObject: registerUserDic, options: []) else {
            return
    }
    request.httpBody = httpBody
    urlSession?.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    onCompletion(true, user)
                } catch {
                    print(error)
                }
            }
        })
        .resume()
    }
    func registerUser(user: User, onCompletion: @escaping ((Bool, User?) -> Void)) {
    let url = URL(string: "\(Constantes.baseURL)\(Constantes.usersRoutes)")
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    //prepare now the body of the request that contain the user data in JSON Format
    let registerUserDic: [String:Any] = ["name":user.name!, "subName":user.subName!, "age":user.age!, "email":user.email!, "password":user.password!, "city":user.city!]
    guard let httpBody = try? JSONSerialization.data(withJSONObject: registerUserDic, options: []) else {
            return
    }
    request.httpBody = httpBody
        let _ = urlSession?.dataTask(with: request, completionHandler: { (data, _, error) in
            if  error != nil {
                onCompletion(false, nil)
            }
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    onCompletion(true, user)
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
}

//
//  LoginAPIService.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation


class LoginAPIService:LoginAPIServiceProtocol{
    var urlSession:URLSession?
        
    init(urlSession:URLSession) {
        self.urlSession = urlSession
    }
    func Connect(login:String,password:String,onCompletion:((Bool,User)->Void)){
        
    }
    
}

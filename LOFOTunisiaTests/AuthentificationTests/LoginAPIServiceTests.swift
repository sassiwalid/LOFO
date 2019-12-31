//
//  LoginAPIServiceTests.swift
//  LOFOTunisiaTests
//
//  Created by walid sassi on 12/31/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import XCTest
@testable import LOFOTunisia
class LoginAPIServiceTests: XCTestCase {
      
    
    func testReturnErrorWhereLoginFailed(){
        //given
        let sut = LoginAPIService(urlSession: URLSessionFake(data: nil, urlResponse: nil, error: FakeResponseData().error))
        
        //when
        sut.Connect(login: "", password: "") { (success, result) in
        //then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        }
        
       
    }
}

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
    var sut : LoginAPIService?
    var login: String?
    var password: String?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testReturnWhereLoginAndPasswordEmpty() {
        //given
        let fakeUrlSession = URLSessionFake(data: nil, urlResponse: nil, error: FakeResponseData().error)
        sut = LoginAPIService(urlSession: fakeUrlSession)
        login = ""
        password = ""
        //when
        sut!.getUser(login: login!, password: password!) { (success, result) in
        //then
            XCTAssertFalse(success)
            XCTAssertNil(result)
        }
    }
    func testReturnWhereLoginAndPasswordDidNotExist() {
        //given
        login = "swa@mobilepowered.fr"
        password = "12345"
        let fakeUrlSession = URLSessionFake(data: FakeResponseData().userCorrectData, urlResponse: FakeResponseData().responseOk, error: nil)
        sut = LoginAPIService(urlSession: fakeUrlSession)
        //when
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        sut!.getUser(login: login!, password: password!) { (success, result) in
        //then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    func testReturnWhereLoginAndPasswordExist() {
        //given
        login = "sassi.walid@gmail.com"
        password = "1234"
        let fakeUrlSession = URLSessionFake(data: FakeResponseData().userCorrectData, urlResponse: FakeResponseData().responseOk, error: nil)
        sut = LoginAPIService(urlSession: fakeUrlSession)
        //when
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        sut!.getUser(login: login!, password: password!) { (success, result) in
        //then
            XCTAssertTrue(success)
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

//
//  FakeResponseData.swift
//  LOFOTunisiaTests
//
//  Created by walid sassi on 12/31/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation


class FakeResponseData{
    let responseOk = HTTPURLResponse(url: URL(string: "http://www.google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])!
    let responseko = HTTPURLResponse(url: URL(string: "http://www.google.com")!, statusCode: 400, httpVersion: nil, headerFields: [:])!
    class AuthenError: Error {
    }
    let error = AuthenError()
    // prepare first the correct user data
    var userCorrectData : Data{
        // get the bundle test
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "user", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    // fake incorrect user data
    let incorrectUserData = "erreur".data(using: .utf8)
}

//
//  URLSEssionFake.swift
//  LOFOTunisiaTests
//
//  Created by walid sassi on 12/31/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation

class URLSessionFake:URLSession{
    let data:Data?
    let urlResponse:URLResponse?
    let error:Error?
    init(data:Data?,urlResponse:URLResponse?,error:Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFake()
        task.completionHandler = completionHandler
        task.data = self.data
        task.urlResponse = self.urlResponse
        task.responseError = self.error
        return task
    }
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFake()
        task.completionHandler = completionHandler
        task.data = self.data
        task.urlResponse = self.urlResponse
        task.responseError = self.error
        return task
    }
}

class URLSessionDataTaskFake:URLSessionDataTask{
    var completionHandler:((Data?,URLResponse?,Error?)->Void)?
    var data:Data?
    var urlResponse:URLResponse?
    var responseError:Error?
    override func resume() {
        completionHandler?(data,urlResponse,responseError)
    }
    override func cancel() {}
    
}

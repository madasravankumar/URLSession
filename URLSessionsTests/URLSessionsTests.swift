//
//  URLSessionsTests.swift
//  URLSessionsTests
//
//  Created by Kumar, Sravan on 09/11/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import XCTest

class URLSessionsTests: XCTestCase {
    var sessionUnderTest: URLSession!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
          sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
          sessionUnderTest = nil
        super.tearDown()
    }
    
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        // given
        let url = URL(string: "https://www.prod.mygd.com/dpubs/ipad_downloads/AIRPORTS_WORLD_WIDE_NEW_201711.zip")
        // 1
        let promise = expectation(description: "Status code: 200")
        var responseError: Error?
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertNil(responseError)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import XCTest
@testable import NetworkInfrastructure

class NetworkRequestTests: XCTestCase {
    
    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetRequest() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.get(url: URL(string:"https://gooogle.com")!, headers: [:])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("gooogle.com")
        
        XCTAssertTrue((urlCheck != nil), "url should contain gooogle.com")
        
    }
    
    func testGetRequestWithHeader() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.get(url: URL(string:"https://gooogle.com")!, headers: ["Content-Type":"image/png"])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "image/jpg"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("gooogle.com")
        
        XCTAssertTrue((urlCheck != nil), "url should contain gooogle.com")
        
        XCTAssertEqual(request.httpMethod, "GET", "Http method should be GET")
        
    }
    
    
    func testGetRequestWithParameter() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.get(url: URL(string:"https://gooogle.com")!, parameters: ["contactId": "abcd-1234"], headers: [:])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("contactId=abcd-1234")
        
        XCTAssertTrue((urlCheck != nil), "url should contain contactId")
        
        XCTAssertEqual(request.httpMethod, "GET", "Http method should be GET")
        
    }
    
    func testPostRequest() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.post(url: URL(string:"https://gooogle.com")!, headers: [:])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("gooogle.com")
        
        XCTAssertTrue((urlCheck != nil), "url should contain gooogle.com")
        
        XCTAssertEqual(request.httpMethod, "POST", "Http method should be POST")
    }
    
    func testPostRequestWithHeader() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.post(url: URL(string:"https://gooogle.com")!, headers: ["Content-Type":"image/png"])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "image/jpg"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("gooogle.com")
        
        XCTAssertTrue((urlCheck != nil), "url should contain gooogle.com")
        
        XCTAssertEqual(request.httpMethod, "POST", "Http method should be POST")
        
    }
    
    func testPostRequestWithParameter() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.post(url: URL(string:"https://gooogle.com")!, parameters: ["contactId": "abcd-1234"], headers: [:])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("contactId=abcd-1234")
        
        XCTAssertTrue((urlCheck != nil), "url should contain contactId")
        
        XCTAssertEqual(request.httpMethod, "POST", "Http method should be POST")
        
    }
    
    func testPutRequest() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let request = NetworkRequest.put(url: URL(string:"https://gooogle.com")!, headers: [:])
        
        let headerCheck = request.allHTTPHeaderFields?.contains { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }
        
        XCTAssertTrue(headerCheck != nil, "Header should contain Content-Type")
        
        let urlCheck = request.url?.absoluteURL.absoluteString.contains("gooogle.com")
        
        XCTAssertTrue((urlCheck != nil), "url should contain gooogle.com")
        
        XCTAssertEqual(request.httpMethod, "PUT", "Http method should be PUT")
    }
    
//    func testPerformanceExample() throws {
//
//        self.measure {
//            _ = getRequest()
////            _ = postRequest()
////            _ = putRequest()
////            _ = patchRequest()
//        }
//    }
}

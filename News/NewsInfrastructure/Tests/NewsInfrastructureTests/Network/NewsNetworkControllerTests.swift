//
//  NewsNetworkControllerTests.swift
//  
//
//  Created by Shinto Joseph on 30/09/2022.
//

import XCTest
import NetworkInfrastructure

@testable import NewsInfrastructure

final class NewsNetworkControllerTests: XCTestCase {
    
    func testNewsNetworkControllerSuccess() async throws {

        let exp = expectation(description: "Wait for network completion")
        
        do {
            let response = try await NewsNetworkController(controller: MockNetworkController(response: NewsArticle.testObject)).getNews()
            
            exp.fulfill()
            XCTAssertEqual(response.articles.count, 1, "count should match")
        }
        catch {
            print(error.localizedDescription)
        }
        wait(for: [exp], timeout: 1.0)
        
    }
    
    func testNewsNetworkControllerError() async throws {
        
        let exp = expectation(description: "Wait for network completion")
        
        do {
            _ = try await NewsNetworkController(controller: MockNetworkController<NewsArticle>(error: APIError.unAuthorized)).getNews()
        }
        catch {
            exp.fulfill()
            XCTAssertEqual(error.localizedDescription, "Unauthorized or expired access token", "should throw error")
        }
        
        wait(for: [exp], timeout: 1.0)
        
    }
    
}

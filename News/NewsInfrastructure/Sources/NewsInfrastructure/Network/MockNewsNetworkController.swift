    //
    //  MockNewsNetworkController.swift
    //
    //
    //  Created by Shinto Joseph on 03/10/2022.
    //

import Foundation
import NetworkInfrastructure

public class MockNewsNetworkControllerSuccess: NewsNetworkControllerProtocol {
    
    let controller: NetworkControllerProtocol
    
    public init(controller: NetworkControllerProtocol = MockNetworkController(
        response: NewsArticle.testObject)) {
            self.controller = controller
        }
    
    public func getNews() async throws -> NewsArticle {
        let reqest = URLRequest(url: URL(string: "https://google.com")!)
        return try await controller.get(request: reqest)
    }
}

public class MockNewsNetworkControllerSuccessEmpty: NewsNetworkControllerProtocol {
    
    let controller: NetworkControllerProtocol
    
    public init(controller: NetworkControllerProtocol = MockNetworkController(
        response: NewsArticle.testObjectEmpty)) {
            self.controller = controller
        }
    
    public func getNews() async throws -> NewsArticle {
        let reqest = URLRequest(url: URL(string: "https://google.com")!)
        return try await controller.get(request: reqest)
    }
}


public class MockNewsNetworkControllerError: NewsNetworkControllerProtocol {
    
    let controller: NetworkControllerProtocol
    
    public init(controller: NetworkControllerProtocol = MockNetworkController<NewsArticle>(
        error: APIError.unAuthorized)) {
            self.controller = controller
        }
    
    public func getNews() async throws -> NewsArticle {
        let reqest = URLRequest(url: URL(string: "https://google.com")!)
        return try await controller.get(request: reqest)
    }
}

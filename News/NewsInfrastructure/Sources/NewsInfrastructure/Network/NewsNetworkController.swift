//
//  NewsNetworkController.swift
//  
//
//  Created by Shinto Joseph on 30/09/2022.
//

import Foundation
import NetworkInfrastructure

public protocol NewsNetworkControllerProtocol {
    func getNews() async throws -> NewsArticle
}

public actor NewsNetworkController: NewsNetworkControllerProtocol {
    
    private let controller: NetworkControllerProtocol
    private let baseURL: URL
    
    public init(baseURL: URL, controller: NetworkControllerProtocol = NetworkController()) {
        self.controller = controller
        self.baseURL = baseURL
    }
    
    public func getNews() async throws -> NewsArticle {
        
        let parameters = [
            "country": "us",
            "category": "business",
            "apiKey": "0f66d062255944e4a747e0f6598618fa"
        ]
        
//        return apiURL("/top-headlines?country=us&category=business&apiKey=0f66d062255944e4a747e0f6598618fa")
        
        
        let request = NetworkRequest.get(url: Urls.News.topHeadlines(baseURL), parameters: parameters, headers: [:])

        return try await controller.get(request: request)
    }
}

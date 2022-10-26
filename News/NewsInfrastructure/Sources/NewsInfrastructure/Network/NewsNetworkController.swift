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
    
    let controller: NetworkControllerProtocol
    
    public init(controller: NetworkControllerProtocol = NetworkController()) {
        self.controller = controller
    }
    
    public func getNews() async throws -> NewsArticle {
        let request = NetworkRequest.get(url: Url.News.topHeadlines, headers: [:])
        print(request.url)
        return try await controller.get(request: request)
    }
}

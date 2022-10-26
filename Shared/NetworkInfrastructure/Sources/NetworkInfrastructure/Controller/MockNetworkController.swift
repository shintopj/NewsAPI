//
//  MockNetworkController.swift
//  
//
//  Created by Shinto Joseph on 30/09/2022.
//

import Foundation

public class MockNetworkController<T: Decodable>:  NetworkControllerProtocol {
    
    var response: T?
    var error: APIError?
    
    public init(error: APIError){
        self.error = error
    }
    
    public init(response: T){
        self.response = response
    }
    
    public func post<T> (request: URLRequest) async throws -> T where T: Decodable {
        
        if let response = response {
            return response as! T
        } else if let error = error {
            throw error
        } else {
            let error = APIError.apiError(reason: "Not implemented")
            throw error
        }
        
    }
    public func get<T>  (request: URLRequest) async throws -> T where T: Decodable {
        if let response = response {
            return response as! T
        } else if let error = error {
            throw error
        } else {
            let error = APIError.apiError(reason: "Not implemented")
            throw error
        }
    }
}

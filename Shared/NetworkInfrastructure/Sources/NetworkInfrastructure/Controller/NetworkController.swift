//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Combine
import Foundation

public protocol NetworkControllerProtocol: AnyObject {
    func post<T> (request: URLRequest) async throws -> T where T: Decodable
    func get<T>  (request: URLRequest) async throws -> T where T: Decodable
}

public final class NetworkController: BaseNetworkConnection, NetworkControllerProtocol {
    
    var session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
  
    public func get<T: Decodable>(request: URLRequest) async throws -> T {
        
        logRequestIfRequired(request)
           
        let response = try await session.data(for: request)
        
        logResponseIfRequired(response)
     
        return try Decoder().decode(from: response)
    }
    
    public func post<T: Decodable>(request: URLRequest) async throws -> T {
        
        logRequestIfRequired(request)
        
        let response = try await session.data(for: request)
        
        logResponseIfRequired(response)
        
        return try Decoder().decode(from: response)
        
    }
    
    private func logResponseIfRequired(_ response: URLSession.DataTaskPublisher.Output) {
        if ProcessInfo.processInfo.arguments.contains("-LogNetworkResponses") {
            
            print("\n================ response=====================")
            if let httpResponse = response.response as? HTTPURLResponse {
                print(httpResponse.url ?? "---url---")
                print(httpResponse.statusCode)
                httpResponse.value(forHTTPHeaderField: "Method")
                print(String(data: response.data, encoding: .utf8)?.prefix(1000) ?? "---data--default---")
            } else {
                print(response)
            }
            print("================end response===============\n")
        }
    }
    
    private func logRequestIfRequired(_ request: URLRequest) {
        if ProcessInfo.processInfo.arguments.contains("-LogNetworkRequests") {
            print("\n================\(String(describing: request.httpMethod)) request=====================")
            print(request)
            print("================\(String(describing: request.httpMethod)) request===============\n")
        }
    }
}


//
//  File.swift
//  
//
//  Created by Shinto Joseph on 12/10/2022.
//

import Combine
import Foundation

public protocol DownloadNetworkControllerProtocol: AnyObject {
    func download (request: URLRequest) -> AnyPublisher<Data, Error>
}

public final class DownloadNetworkController: BaseNetworkConnection, DownloadNetworkControllerProtocol {
    
    var session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func download (request: URLRequest) -> AnyPublisher<Data, Error> {
        
        logRequestIfRequired(request)
        
        return session.dataTaskPublisher(for: request)
            .retry(1)
            .timeout(45, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap { response -> Data in
                return try Decoder().handleResponse(response)
            }
            .mapError { error in
                print(#function, error)
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
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


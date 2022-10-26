//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//
import Foundation

public final class NetworkRequest: NSObject {
        
    public static func get(url baseURL: URL, headers: [String: String]) -> URLRequest {
        var request = URLRequest(url: baseURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    public static func get(url baseURL: URL, parameters: [String: String], headers: [String: String]) -> URLRequest {
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        
        components?.queryItems = parameters.map { key, value -> URLQueryItem in
            return URLQueryItem(name: key, value: value)
        }
        
        guard let url = components?.url else {
            fatalError("baseURL could not be configured.")
        }
        
        return get(url: url, headers: headers)
    }
    
    public static func post(url: URL, headers: [String: String]) -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    static func post(url baseURL: URL, parameters: [String: String], headers: [String: String]) -> URLRequest {
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        
        components?.queryItems = parameters.map { key, value -> URLQueryItem in
            return URLQueryItem(name: key, value: value)
        }
        
        guard let url = components?.url else {
            fatalError("baseURL could not be configured.")
        }
        
        return post(url: url, headers: headers)
    }
    
    static func patch(url: URL, headers: [String: String]) -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        request.httpMethod = "PATCH"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    static func put(url baseURL: URL, headers: [String: String]) -> URLRequest {
        var request = URLRequest(url: baseURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}

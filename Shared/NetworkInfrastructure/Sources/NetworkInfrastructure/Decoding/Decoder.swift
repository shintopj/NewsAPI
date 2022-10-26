//
//  File.swift
//  
//
//  Created by Shinto Joseph on 30/09/2022.
//

import Foundation

final class Decoder {
    
    private var jsonDecoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .customISO8601
        return jsonDecoder
    }
    
//    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
//        return try jsonDecoder.decode(type, from: data)
//    }
    
    func decode<T:Decodable>(from response: URLSession.DataTaskPublisher.Output) throws -> T where T : Decodable {
        
        do {
            let data = try handleResponse(response)
            
            let resp = try jsonDecoder.decode(T.self, from: data)
            return resp
        } catch {
            print(error)
            throw error
        }
    }
    
    func handleResponse(_ response: URLSession.DataTaskPublisher.Output) throws -> Data {
        
        guard let httpResponse = response.response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        
        if 200..<300 ~= httpResponse.statusCode, !response.data.isEmpty {
            return response.data
        } else if 400..<417 ~= httpResponse.statusCode {
            if !response.data.isEmpty, let reason = String(data: response.data, encoding: .utf8) {
                throw APIError.apiError(reason: reason)
            } else {
                let message: String = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)
                print(message)
                throw APIError.unAuthorized
            }
        } else if 500..<1000 ~= httpResponse.statusCode {
            if !response.data.isEmpty, let reason = String(data: response.data, encoding: .utf8) {
                throw APIError.apiError(reason: reason)
            } else {
                throw APIError.apiError(reason: "Internal Server Error")
            }
        } else if 1001..<1010 ~= httpResponse.statusCode {
            if !response.data.isEmpty, let reason = String(data: response.data, encoding: .utf8) {
                throw APIError.apiError(reason: reason)
            } else {
                throw APIError.noNetwork
            }
        }
        throw APIError.unknown
        
    }
    
    
}

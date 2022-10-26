//
//  File.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import Foundation

public enum APIError: Error, LocalizedError {
    case unknown, unAuthorized, apiError(reason: String), noNetwork
    
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return Strings.ErrorMessages.unknown
            
        case .unAuthorized:
            return Strings.ErrorMessages.unAuthorized
            
        case .noNetwork:
            return Strings.ErrorMessages.noNetwork
            
        case .apiError(let reason):
            return reason
        }
    }
}

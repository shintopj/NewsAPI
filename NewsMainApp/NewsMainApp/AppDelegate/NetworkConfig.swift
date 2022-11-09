//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

final class NetworkConfig {
    
    // MARK: - Network environment
    private enum NetworkEnvironment {
        case development
        case staging
        case production
    }
    
    static private var environment: NetworkEnvironment {
        #if DEBUG
            return .development
        #elseif STAGING
            return .staging
        #else
            return .production
        #endif
    }
    
    // MARK: - BaseURL API
    static private var environmentBaseURLApi: String {
        switch environment {
        case .production:
            return "https://newsapi.org/v2"
        case .staging:
            return "https://newsapi.org/v2"
        case .development:
            return "https://newsapi.org/v2"
        }
    }
    
    // MARK: - BaseURL
    static var apiBaseURL: URL {
        guard let url = URL(string: environmentBaseURLApi) else { fatalError("baseURL could not be configured.") }
        print(environment)
        return url
    }
}

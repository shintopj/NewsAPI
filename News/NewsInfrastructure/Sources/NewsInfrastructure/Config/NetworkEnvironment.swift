//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

// MARK: - Network environment
enum NetworkEnvironment {
    case development
    case staging
    case production
}

var environment: NetworkEnvironment {
    #if DEBUG
    return .development
    #elseif STAGING
    return .staging
    #else
    return .production
    #endif
}

// MARK: - BaseURL API
private var environmentBaseURLApi: String {
    switch environment {
    case .production:
        return "https://newsapi.org/v2"
    case .staging:
        return "https://newsapi.org/v2"
    case .development:
        return "https://newsapi.org/v2"
    }
}

var apiURL: (String) -> URL = { path in
    guard let url = URL(string: environmentBaseURLApi.appending(path)) else { fatalError("baseURL could not be configured.") }
    print(environment)
    return url
}

//
//  File.swift
//  
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

enum Strings {
        // MARK: - Loading
    static let loading = "Loading..."
    static let loggingOff = "Logging off..."
    static let offline = "You are offline"
    static let noNetwork = "Could not get data from the remote server. Check your connection settings"
    static let applicationError = "There is an error processing your request. Please try again"
    static let noData = "No data"
    
    enum ErrorMessages {
        static let unknown = "Unknown error"
        static let unAuthorized = "Unauthorized or expired access token"
        static let hostNotReachable = "Unauthorized access token or Host not reachable"
        static let noNetwork = "No Network Connection, please check your internet"
    }
}

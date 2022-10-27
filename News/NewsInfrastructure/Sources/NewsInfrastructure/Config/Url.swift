//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

enum Urls {
    enum News {
        
        static var topHeadlines: (URL) -> URL = { baseURL in
            return baseURL.appendingPathComponent("top-headlines")
        }
    }
}

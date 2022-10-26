//
//  File.swift
//
//
//  Created by Shinto Joseph on 07/09/2022.
//

import Foundation

enum Url {
    
    enum News {
        static var topHeadlines: URL {
            return apiURL("/top-headlines?country=us&category=business&apiKey=0f66d062255944e4a747e0f6598618fa")
        }
    }
}

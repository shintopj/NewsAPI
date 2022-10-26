//
//  File.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import Foundation
import NewsInfrastructure
import SwiftUI

public struct NewsListModel: Identifiable, Hashable {
    
    public let title: String
    public let url: String?
    private let publishedDate: Date?
    
    public var publishedAt: String {
        get {
            if let date = publishedDate {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                return formatter.string(from: date)
            }
            
            return ""
        }
    }
        
    public init(article: Article) {
        self.title = article.title
        self.url = article.urlToImage
        self.publishedDate = article.publishedAt
    }
    
    init(title: String) {
        self.title = title
        self.publishedDate = nil
        self.url = nil
    }
    
    public init(title: String, url: String?) {
        self.title = title
        self.publishedDate = nil
        self.url = url
    }
    
    public var id: String {
        title
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

extension NewsListModel {
    public static var testObject: NewsListModel {
        NewsListModel(
            title: "U.S. to use FDPR rule on Chinese buyers of AI and supercomputing chips - The Washington Post")
    }
}

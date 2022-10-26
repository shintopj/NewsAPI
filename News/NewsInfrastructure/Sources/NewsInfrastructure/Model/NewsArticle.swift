//
//  File.swift
//  
//
//  Created by Shinto Joseph on 30/09/2022.
//

import Foundation

// MARK: - NewsArticle
public struct NewsArticle: Codable {
    public var status: String
    public var totalResults: Int
    public var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}

    // MARK: - Article
public struct Article: Codable {
    public var source: Source
    public var author: String?
    public var title: String
    public var articleDescription: String?
    public var url: String
    public var urlToImage: String?
    public var publishedAt: Date?
    public var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

    // MARK: - Source
public struct Source: Codable {
    public var id: String?
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

public extension NewsArticle {
    static var testObject: NewsArticle {
        return NewsArticle(status: "Ok", totalResults: 1, articles: [
            Article.testObject
        ])
    }
    
    static var testObjectEmpty: NewsArticle {
        return NewsArticle(status: "Error", totalResults: 0, articles: [
        ])
    }
}

public extension Article {
    static var testObject: Article {
        return Article(source: Source(name: "CNBC"), title: "test 1", url: "https://google.com", publishedAt: Date())
    }
}

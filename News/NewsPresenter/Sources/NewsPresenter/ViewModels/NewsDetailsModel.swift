//
//  NewsDetailsModel.swift
//  
//
//  Created by Shinto Joseph on 04/10/2022.
//

import Foundation
import NewsInfrastructure

public struct NewsDetailsModel {
    
    public var author: String
    public var title: String
    public var urlToImage: String?
    private var publishedDate: Date?
    
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
    
    public var content: String
    
    public init(article: Article) {
        
        self.author = article.author ?? article.source.name
        self.title = article.title
        self.urlToImage = article.urlToImage
        self.publishedDate = article.publishedAt
        self.content = article.content ?? article.articleDescription ?? ""
    }
    
    init(author: String, title: String, url: String, content: String) {
        self.author = author
        self.title = title
        self.urlToImage = url
        self.content = content
    }
    
}

extension NewsDetailsModel {
    public static var testObject: NewsDetailsModel {
        NewsDetailsModel(
            author: "Ellen Nakashima, Jeanne Whalen",
            title: "U.S. to use FDPR rule on Chinese buyers of AI and supercomputing chips - The Washington Post",
            url: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/EXIZHYWKYEI6XBYIMSMR6KWPFA.jpg&w=1440",
            content: "The Biden administration is preparing new rules aimed at curbing Chinas advanced computing and chip production capabilities the U.S. governments most significant effort to date to restrain Chinas dev… [+4315 chars]")
    }
}

import XCTest
import NewsInfrastructure
import SwiftUI

@testable import NewsPresenter

final class NewsPresenterTests: XCTestCase {
    
    @ObservedObject var sut = NewsPresenter()
    
    func testGetNewsArticlesSuccess() async throws {
 
        await sut.getNewsArticles(networkController: MockNewsNetworkControllerSuccess())
        XCTAssertEqual(sut.list?.count, 1, "One article should load")
    }
    
    func testGetNewsArticlesEmptyResults() async throws {
        
        await sut.getNewsArticles(networkController: MockNewsNetworkControllerSuccessEmpty())
        XCTAssertNil(sut.list, "articles should be nil")
        XCTAssertEqual(sut.error?.localizedDescription, "The operation couldn’t be completed. (No Data error 10.)" , "No data retured from server")
    }
    
    func testGetNewsArticlesError() async throws {
        await sut.getNewsArticles(networkController: MockNewsNetworkControllerError())
        XCTAssertNotNil(sut.error, "should handle error")
    }
    
    func testNewsDetailsModel() async throws {
        let testObject = Article.testObject
        let sut = NewsDetailsModel(article: .testObject)
        XCTAssertEqual(sut.title, testObject.title,  "should match title")
    }
    
//    func testGetNewsDetailsModel() async throws {
//        await sut.getNewsArticles(networkController: MockNewsNetworkControllerError())
//        let testObject =  sut.getNewsDetailsModel(from: .testObject)
//        XCTAssertEqual(testObject.title, "test 1",  "should match title")
//        XCTAssertNotNil(testObject.publishedAt, "should return date")
//    }
    
    func testNewsDetailsModelInit() async throws {
        let sut = NewsDetailsModel(author: "author", title: "title 1", url: "https://google.com", content: "lpsum lorem")
        XCTAssertEqual(sut.author, "author",  "should match title")
        XCTAssertEqual(sut.title, "title 1",  "should match title")
    }
}

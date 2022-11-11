
import Foundation
import NewsInfrastructure

public class NewsPresenter: ObservableObject {
    
    @Published public var list: [NewsListModel]?
    @Published public var error: Error?
    
    private var articles: [Article]?
    private var baseURL: URL
    
    public init(url baseURL: URL) {
        self.baseURL = baseURL
        getNews()
    }
    
    public func getNews() {
        Task {
            await getNewsArticles(networkController: NewsNetworkController(baseURL: baseURL))
        }
    }
    
    public func getNewsArticles(networkController: NewsNetworkControllerProtocol) async {
        
        do {
            let newsArticles = try await networkController.getNews()
            
            DispatchQueue.main.async {
                if !newsArticles.articles.isEmpty {
                    self.articles = newsArticles.articles
                    self.list = newsArticles.articles.map { item in
                        NewsListModel(article: item)
                    }
                } else {
                    self.error = NSError(domain: "No Data", code: 10)
                }
            }
            
        } catch {
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
    
    public func getNewsDetailsModel(from: NewsListModel) -> NewsDetailsModel {
        let article = articles?.first {
            $0.title == from.title
        }
        return NewsDetailsModel(article: article!)
    }
    
}

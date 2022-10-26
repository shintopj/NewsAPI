//
//  NewsTableViewController.swift
//  
//
//  Created by Shinto Joseph on 14/10/2022.
//

import Foundation
import Combine
import UIKit
import NewsPresenter

public class NewsTableViewController: DiffableTableViewController<NewsTableViewCell, NewsListModel> {
    
    let presenter: NewsPresenter
    private var cancellables = Set<AnyCancellable>()
    var callBack: (NewsDetailsModel) -> Void
    
    public init(presenter: NewsPresenter = NewsPresenter(), callBack: @escaping (NewsDetailsModel) -> Void) {
        self.presenter = presenter
        self.callBack = callBack
        super.init(nibName: "NewsTableViewController", bundle: Bundle.module)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        state = UIState(status: .loading)
        getNotifications()
    }
    
    func getNotifications() {
        
        presenter.$list.sink { newsList in
            guard let list = newsList else {
                self.state?.update(status: .noData)
                return
            }
            self.models = list
        }
        .store(in: &cancellables)
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = dataSource?.itemIdentifier(for: indexPath) {
            print(#function, item)
            callBack(presenter.getNewsDetailsModel(from: item))
        }
    }
}

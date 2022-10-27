//
//  NewsKitPageConfigurator.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 14/10/2022.
//

import UIKit
import NewsPresenter
import NewsKit

enum NewsKitPageConfigurator {
    
    static func createNewsPage() -> UINavigationController {
        
        let vc = NewsTableViewController(
            presenter: NewsPresenter(url: NetworkConfig.apiBaseURL)) { item in
            Router.toNewsKitDetails(item: item)
        }
  
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = "News Kit"
        
        navController.tabBarItem.title = "News Kit"
        navController.tabBarItem.image = UIImage(systemName: "scribble.variable")
        return navController
    }
}


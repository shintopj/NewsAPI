//
//  NewsPageConfigurator.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 04/10/2022.
//

import SwiftUI
import UIKit
import NewsPresenter
import NewsUI

enum NewsPageConfigurator {
    
    static func createNewsPage() -> UINavigationController {
        let view = NewsPageView(store: NewsPresenter(url: NetworkConfig.apiBaseURL)) { detailsItem in
            Router.toNewsDetails(item: detailsItem)
        }
        
        let vc = UIHostingController(rootView: view)
        
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = "News"
        
        navController.tabBarItem.title = "News"
        navController.tabBarItem.image = UIImage(systemName: "newspaper")
        return navController
    }
    
    static func createNewsDetailsPage(item: NewsDetailsModel) -> UIHostingController<NewDetailsPageView> {
        let view = NewDetailsPageView(item: item)
        let vc = UIHostingController(rootView: view)
        vc.navigationItem.title = "News Details"
        return vc
    }
    
}


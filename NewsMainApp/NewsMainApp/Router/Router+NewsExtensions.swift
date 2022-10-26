//
//  Router+NewsExtensions.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 04/10/2022.
//

import Foundation
import NewsPresenter

extension Router {
    
    static func toNewsDetails(item: NewsDetailsModel) {
        
        if let navController = shared.getNavigationController(type: "News") {
            let vc = NewsPageConfigurator.createNewsDetailsPage(item: item)
            vc.hidesBottomBarWhenPushed = true
            navController.pushViewController(vc, animated: true)
        }
    }
    
    static func toNewsKitDetails(item: NewsDetailsModel) {
        
        if let navController = shared.getNavigationController(type: "News Kit") {
            let vc = NewsPageConfigurator.createNewsDetailsPage(item: item)
            vc.hidesBottomBarWhenPushed = true
            navController.pushViewController(vc, animated: true)
        }
    }
    
    
}

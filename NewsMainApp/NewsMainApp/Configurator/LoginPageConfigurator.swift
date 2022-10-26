//
//  LoginPageConfigurator.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 04/10/2022.
//

import UIKit
import SwiftUI
import AuthUI
import AuthPresenter

enum LoginPageConfigurator {
    
    static func create(store: LoginStore) -> UINavigationController {
        
        let view = LoginPageView(store: store)
        let vc = UIHostingController(rootView: view)
        
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = "Login"
        return navController
    }
    
    static func profilePage() -> UINavigationController {
        let view = LogoutPageView(store: Router.shared.loginStore)
        let vc = UIHostingController(rootView: view)
        
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = "Profile"
        
        navController.tabBarItem.title = "Profile"
        navController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        return navController
    }
    
}

//
//  Router.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 03/10/2022.
//

import SwiftUI
import UIKit
import Combine
import AuthPresenter
import AuthUI

class Router {
    
    static let shared = Router()
    private init() {}
    
    private var window: UIWindow!
    private var windowScene: UIWindowScene!
    
    private var mainTabBar: MainTabBar?
    var loginStore = LoginStore(user: User(name: "shinto"))
    private var cancellables = Set<AnyCancellable>()
    
    func configure(scene: UIWindowScene) {
        windowScene = scene
        window = UIWindow(windowScene: windowScene)
        window.frame = windowScene.coordinateSpace.bounds
        
        loginStore.$user.sink { [weak self] user in
            self?.initalizeApp(user: user)
        }
        .store(in: &cancellables)
    }
    
    func initalizeApp(user: User?) {
        
        if let user = user {
            toMainScreen(user)
        } else {
            toLoginScreen()
        }
    }
    
    func toLoginScreen() {
        let view = LoginPageConfigurator.create(store: loginStore)
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
    
    func toMainScreen(_ user: User) {
        mainTabBar = MainTabBar()
        window.rootViewController = mainTabBar
        window.makeKeyAndVisible()
    }
    
}

extension Router {
    
        // MARK: - Helper methods
    func getNavigationController(type: String) -> UINavigationController? {
        
        switch type {
        case "News":
            return mainTabBar?.viewControllers?[0] as? UINavigationController
            
        case "News Kit":
            return mainTabBar?.viewControllers?[1] as? UINavigationController
            
            
        default:
                // more case and other navigations
            return mainTabBar?.viewControllers?[2] as? UINavigationController
            
        }
    }
    
}

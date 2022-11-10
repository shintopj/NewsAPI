//
//  MainTabBar.swift
//  NewsMainApp
//
//  Created by Shinto Joseph on 03/10/2022.
//

import SwiftUI
import UIKit
import NewsUI

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        selectedIndex = 0
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        .lightContent
//    }
    
    func setupVCs() {
        viewControllers = [
            NewsPageConfigurator.createNewsPage(),
            NewsKitPageConfigurator.createNewsPage(),
            LoginPageConfigurator.profilePage()
        ]
    }
}


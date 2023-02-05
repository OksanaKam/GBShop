//
//  TabBarController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 19.01.2023.
//

import UIKit

enum Tabs: Int {
    case catalog
    case basket
    case settings
}

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        tabBar.tintColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        
        tabBar.layer.borderColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0).cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let mainController = MainViewController()
        let basketController = BasketViewController()
        let userController = UserViewController()
        
        let mainNavigationController = UINavigationController(rootViewController: mainController)
        mainNavigationController.navigationBar.isHidden = true
        let basketNavigationController = UINavigationController(rootViewController: basketController)
        basketNavigationController.navigationBar.isHidden = true
        let userNavigationController = UINavigationController(rootViewController: userController)
        userNavigationController.navigationBar.isHidden = true
        
        mainController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBarHeaders.catalog,
            image: UIImage(systemName: Resources.Strings.TabBarIconsNames.catalog),
            tag: Tabs.catalog.rawValue)
        basketController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBarHeaders.basket,
            image: UIImage(systemName: Resources.Strings.TabBarIconsNames.basket),
            tag: Tabs.basket.rawValue)
        userController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBarHeaders.settings,
            image: UIImage(systemName: Resources.Strings.TabBarIconsNames.settings),
            tag: Tabs.settings.rawValue)
        
        setViewControllers([
            mainNavigationController,
            basketNavigationController,
            userNavigationController
        ], animated: false)
    }
}

//
//  StartPage.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class StartPage {
    
    var window: UIWindow?
    
    let requestFactory = RequestFactory()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = AuthAssembler.build(requestFactory: requestFactory)
        rootVC.navigationItem.title = "Login"
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.isHidden = true
        return navVC
    }()
}

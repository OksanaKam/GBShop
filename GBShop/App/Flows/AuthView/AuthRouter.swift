//
//  AuthRouter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

protocol AuthRouterProtocol {
    func presentShopViewController()
    func presentRegistrationViewController()
}

final class AuthRouter {
    weak var viewController: UIViewController?
}

extension AuthRouter: AuthRouterProtocol {
    func presentShopViewController() {
        DispatchQueue.main.async {
            let tabBarController = TabBarBuilder.build()
            self.viewController?.navigationController?.pushViewController(tabBarController, animated: true)
        }
    }
    
    func presentRegistrationViewController() {
        let requestFactory = RequestFactory()
        let regViewController = RegisterAssembler.build(requestFactory: requestFactory)
        viewController?.navigationController?.navigationBar.isHidden = false
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(regViewController, animated: true)
        }
    }
}

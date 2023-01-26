//
//  RegisterRouter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

protocol RegisterRouterProtocol {
    func presentLoginViewController()
}

final class RegisterRouter {
    weak var viewController: UIViewController?
}

extension RegisterRouter: RegisterRouterProtocol {
    func presentLoginViewController() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
        }
    }
}

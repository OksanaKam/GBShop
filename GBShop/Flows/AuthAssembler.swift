//
//  AuthAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class AuthAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let authNetwork = requestFactory.makeAuthRequestFatory()
        let interactor = AuthInteractor(networkService: authNetwork)
        let router = AuthRouter()
        let presenter = AuthPresenter(interactor: interactor, router: router)
        let viewController = AuthViewController()
        viewController.presenter = presenter
        presenter.authorizationView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

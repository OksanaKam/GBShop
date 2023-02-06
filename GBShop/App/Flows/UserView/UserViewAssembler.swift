//
//  UserViewAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 19.01.2023.
//

import UIKit

final class UserViewAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let userInfoNetwork = requestFactory.makeChangeDataUserRequsetFactory()
        let interactor = UserViewInteractor(networkService: userInfoNetwork)
        let router = UserViewRouter()
        let presenter = UserViewPresenter(interactor: interactor, router: router)
        let viewController = UserViewController()
        viewController.presenter = presenter
        presenter.userViewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

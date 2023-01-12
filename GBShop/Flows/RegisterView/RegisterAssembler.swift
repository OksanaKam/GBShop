//
//  RegisterAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class RegisterAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let authNetwork = requestFactory.makeRegisterRequestFactory()
        let interactor = RegisterInteractor(networkService: authNetwork)
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        let viewController = RegisterViewController()
        viewController.presenter = presenter
        presenter.registrationView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

//
//  BasketAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

final class BasketAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let basketNetwork = requestFactory.makeBasketRequestFactory()
        let interactor = BasketInteractor(networkService: basketNetwork)
        let router = BasketRouter()
        let presenter = BasketPresenter(interactor: interactor, router: router)
        let viewController = BasketViewController()
        viewController.presenter = presenter
        presenter.basketsView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}


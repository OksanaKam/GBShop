//
//  MainAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

final class MainViewAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let catalogNetwork = requestFactory.makeCatalogRequestFactory()
        let interactor = MainViewInteractor(networkService: catalogNetwork)
        let router = MainViewRouter()
        let presenter = MainViewPresenter(interactor: interactor, router: router)
        let tableAdapter = Menu()
        let viewController = MainViewController(presenter: presenter, tableAdapter: tableAdapter)
        presenter.mainView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

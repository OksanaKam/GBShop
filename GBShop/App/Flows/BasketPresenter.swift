//
//  BasketPresenter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

protocol BasketViewOutput: AnyObject {
    func clearBasketButtonTapped()
    func buyButtonTapped()
    func showErrorBasket(error: String)
    func startActivityIndicator()
    func stopActivityIndicator()
}

final class BasketPresenter {
    weak var basketsView: BasketViewInput?
    var router: BasketRouterProtocol
    var interactor: BasketInteractorProtocol
    
    init(interactor: BasketInteractorProtocol,
         router: BasketRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension BasketPresenter: BasketViewOutput {
    func showErrorBasket(error: String) {
        basketsView?.showAlertController(with: error)
    }
    
    func clearBasketButtonTapped() {
    }
    
    func buyButtonTapped() {
    }
    
    func startActivityIndicator() {
        basketsView?.startShowingActivityIndicator()
    }
    
    func stopActivityIndicator() {
        basketsView?.stopShowingActivityIndicator()
    }
}


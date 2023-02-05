//
//  BasketInteractor.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

protocol BasketInteractorProtocol {
    func clearBasketButtonTapped(productName: String, quantity: Int)
    func buyButtonTapped(sum: Int)
}

final class BasketInteractor {
    weak var presenter: BasketViewOutput?
    
    var networkService: BasketRequestFactory
    
    init(networkService: BasketRequestFactory) {
        self.networkService = networkService
    }
}

extension BasketInteractor: BasketInteractorProtocol {
    func clearBasketButtonTapped(productName: String, quantity: Int) {
        guard
            productName != "",
            quantity != 0
        else {
            self.presenter?.showErrorBasket(error: "The basket is empty")
            return
        }
    }
    
    func buyButtonTapped(sum: Int) {
        guard
            sum != 0
        else {
            self.presenter?.showErrorBasket(error: "The basket is empty")
            return
        }
    }
}


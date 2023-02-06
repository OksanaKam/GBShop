//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func getBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
    func addBasket(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddBasketResult>) -> Void)
    func deleteBasket(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<DeleteBasketResult>) -> Void)
    func payBasket(idUser: Int, userCreditCard: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
}

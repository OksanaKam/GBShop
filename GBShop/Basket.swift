//
//  Basket.swift
//  GBShop
//
//  Created by Оксана Каменчук on 08.01.2023.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Basket: BasketRequestFactory {
    
    func getBasket(idUser: Int, completionHandler: @escaping (Alamofire.AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = GetBasket(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addBasket(productId: Int, quantity: Int, completionHandler: @escaping (Alamofire.AFDataResponse<AddBasketResult>) -> Void) {
        let requestModel = AddBasket(baseUrl: baseUrl, productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteBasket(productId: Int, quantity: Int, completionHandler: @escaping (Alamofire.AFDataResponse<DeleteBasketResult>) -> Void) {
        let requestModel = DeleteBasket(baseUrl: baseUrl, productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func payBasket(idUser: Int, userCreditCard: Int, completionHandler: @escaping (Alamofire.AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = PayBasket(baseUrl: baseUrl, idUser: idUser, userCreditCard: userCreditCard)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Basket {
    struct GetBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
}

extension Basket {
    struct AddBasket: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addToBasket.json"
        let productId: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "productId": productId,
                "quantity": quantity
            ]
        }
    }
}

extension Basket {
    struct DeleteBasket: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "deleteFromBasket.json"
        let productId: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "productId": productId,
                "quantity": quantity
            ]
        }
    }
}

extension Basket {
    struct PayBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        let idUser: Int
        let userCreditCard: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "userCreditCard": userCreditCard
            ]
        }
    }
}

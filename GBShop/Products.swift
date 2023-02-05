//
//  Products.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import Foundation
import Alamofire

class Products: AbstractRequestFactory {
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

extension Products: ProductRequestFactory {
    func getProduct(productId: Int, completionHandler: @escaping (Alamofire.AFDataResponse<ProductResult>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProductData(pageNumber: Int, categoryId: Int, completionHandler: @escaping (Alamofire.AFDataResponse<CatalogDataResult>) -> Void) {
        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Products {
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}

extension Products {
    struct CatalogData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "catalogData.json"
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}

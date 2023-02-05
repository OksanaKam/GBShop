//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
    func getProductData(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
}

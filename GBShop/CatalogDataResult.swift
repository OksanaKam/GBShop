//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import Foundation

struct CatalogDataResult: Codable {
    let productId: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case price
    }
}

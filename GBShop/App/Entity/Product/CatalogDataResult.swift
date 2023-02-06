//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 19.01.2023.
//

import Foundation

struct CatalogDataResult: Codable {
    let productId: Int
    let productName: String
    let price: Int
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case price
        case imageUrl = "image_url"
    }
}

struct CatalogResult: Codable {
    let pageNumber: Int
    let product: [CatalogDataResult]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case product
    }
}


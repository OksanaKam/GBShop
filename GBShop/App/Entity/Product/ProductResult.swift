//
//  ProductResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}

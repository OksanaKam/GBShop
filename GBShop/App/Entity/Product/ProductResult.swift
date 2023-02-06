//
//  ProductResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let productId: Int
    let productName: String
    let productPicture: String
    let productPrice: Int
    let productDescription: String
    let productRating: Int
    let reviewsNumber: Int
    let productReview: [Review]
    
    enum CodingKeys: String, CodingKey {
        case result
        case productId = "id_product"
        case productName = "product_name"
        case productPicture = "product_picture"
        case productPrice = "product_price"
        case productDescription = "product_description"
        case productRating = "product_rating"
        case reviewsNumber = "reviews_number"
        case productReview = "product_reviews"
    }
}

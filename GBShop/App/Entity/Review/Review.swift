//
//  Review.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

struct Review: Codable {
    let reviewId: Int
    let productId: Int
    let reviewAuthor: String
    let reviewDate: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
            case reviewId = "review_id"
            case productId = "product_id"
            case reviewAuthor = "review_author"
            case reviewDate = "review_date"
            case text = "review_text"
        }
}

//
//  Review.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.01.2023.
//

import Foundation

struct Review: Codable {
    let reviewId: Int
    let productId: Int
    let text: String
}

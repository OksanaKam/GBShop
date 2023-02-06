//
//  BasketResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

struct BasketResult: Codable {
    let productId: Int
    let productName: String
    let productQuantity: Int
}

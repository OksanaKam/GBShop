//
//  GetBasketResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

struct GetBasketResult: Codable {
    var amount: Int
    var countGoods: Int
    var contents: [BasketResult]
        
    enum CodingKeys: String, CodingKey {
        case amount
        case countGoods = "count_goods"
        case contents
    }
}

//
//  DeleteBasketResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 07.01.2023.
//

import Foundation

struct DeleteBasketResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

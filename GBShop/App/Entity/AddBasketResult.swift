//
//  AddBasketResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

struct AddBasketResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

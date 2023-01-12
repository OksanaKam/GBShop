//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

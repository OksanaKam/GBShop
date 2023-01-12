//
//  RemoveReviewResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.01.2023.
//

import Foundation

struct RemoveReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

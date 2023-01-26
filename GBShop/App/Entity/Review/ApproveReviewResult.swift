//
//  ApproveReviewResult.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

struct ApproveReviewResult: Codable {
    let result: Int
    let approveReview: [Review]
    
    enum CodingKeys: String, CodingKey {
        case result
        case approveReview
    }
}

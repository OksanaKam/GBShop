//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 01.01.2023.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func approveReview(productId: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void)
    func addReview(productId: Int, userName: String, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    func removeReview(productId: Int, userName: String, reviewId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}

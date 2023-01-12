//
//  Reviews.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import Foundation
import Alamofire

class Reviews: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Reviews: ReviewRequestFactory {
    func approveReview(productId: Int, completionHandler: @escaping (Alamofire.AFDataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = ApproveReview(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(productId: Int, userName: String, text: String, completionHandler: @escaping (Alamofire.AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, productId: productId, userName: userName, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(productId: Int, userName: String, reviewId: Int, completionHandler: @escaping (Alamofire.AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, productId: productId, userName: userName, reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Reviews {
    struct ApproveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview.json"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}

extension Reviews {
    struct AddReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addReview.json"
        let productId: Int
        let userName: String
        let text: String
        var parameters: Parameters? {
            return [
                "productId": productId,
                "userName": userName,
                "text": text
            ]
        }
    }
}

extension Reviews {
    struct RemoveReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "removeReview.json"
        let productId: Int
        let userName: String
        let reviewId: Int
        var parameters: Parameters? {
            return [
                "productId": productId,
                "userName": userName,
                "reviewId": reviewId
            ]
        }
    }
}

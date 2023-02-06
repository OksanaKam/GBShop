//
//  ReviewInteractor.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.02.2023.
//

import UIKit

protocol ReviewInteractorProtocol {
    func leaveReviewButtonTapped(userName: String, textReview: String)
}

final class ReviewInteractor {
    weak var presenter: ReviewOutput?
    
    var networkService: ReviewRequestFactory
    
    init(networkService: ReviewRequestFactory) {
        self.networkService = networkService
    }
}

extension ReviewInteractor: ReviewInteractorProtocol {
    func leaveReviewButtonTapped(userName: String, textReview: String) {
        guard
            userName != "",
            textReview != ""
        else {
            self.presenter?.showErrorReview(error: "You can`t use empty Review")
            return
        }
    }
}

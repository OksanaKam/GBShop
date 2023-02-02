//
//  ReviewPresenter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.02.2023.
//

import UIKit

protocol ReviewOutput: AnyObject {
    func leaveReviewButtonTapped()
    func showErrorReview(error: String)
    func startActivityIndicator()
    func stopActivityIndicator()
}

final class ReviewPresenter {
    weak var reviewsView: ReviewInput?
    var router: ReviewRouterProtocol
    var interactor: ReviewInteractorProtocol
    
    init(interactor: ReviewInteractorProtocol,
         router: ReviewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ReviewPresenter: ReviewOutput {
    func showErrorReview(error: String) {
        reviewsView?.showAlertController(with: error)
    }
    
    func leaveReviewButtonTapped() {
    }
    
    func startActivityIndicator() {
        reviewsView?.startShowingActivityIndicator()
    }
    
    func stopActivityIndicator() {
        reviewsView?.stopShowingActivityIndicator()
    }
}

//
//  ReviewAssembler.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.02.2023.
//

import UIKit

final class ReviewAssembler {
    static func build(requestFactory: RequestFactory) -> UIViewController {
        let requestFactory = requestFactory
        let reviewNetwork = requestFactory.makeReviewsRequestFactory()
        let interactor = ReviewInteractor(networkService: reviewNetwork)
        let router = ReviewRouter()
        let presenter = ReviewPresenter(interactor: interactor, router: router)
        let viewController = ReviewViewController()
        viewController.presenter = presenter
        presenter.reviewsView = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

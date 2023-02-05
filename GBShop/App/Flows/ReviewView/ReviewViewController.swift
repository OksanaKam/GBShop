//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.02.2023.
//

import UIKit

protocol ReviewInput: AnyObject {
    func showAlertController(with error: String)
    func startShowingActivityIndicator()
    func stopShowingActivityIndicator()
}

final class ReviewViewController: UIViewController {
    
    private var reviewView: ReviewView {
        guard let view = self.view as? ReviewView else {
            let correctView = ReviewView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: ReviewOutput?
    
    override func loadView() {
        super.loadView()
        self.view = ReviewView(frame: self.view.frame)
        reviewView.reviewViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reviewView.subscribeObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reviewView.unsubscribeObserver()
    }
}

extension ReviewViewController: ReviewInput {
    func showAlertController(with error: String) {
        DispatchQueue.main.async {
            self.present(self.reviewView.presentAlert(error: error),
                         animated: true)
        }
    }
    
    func startShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.reviewView.activityIndicator.startAnimating()
        }
    }
    
    func stopShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.reviewView.activityIndicator.stopAnimating()
        }
    }
}

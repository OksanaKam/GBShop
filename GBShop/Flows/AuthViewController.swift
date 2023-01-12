//
//  AuthViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

protocol AuthViewInput: AnyObject {
    func showAlertController(with error: String)
    func startShowingActivityIndicator()
    func stopShowingActivityIndicator()
}

final class AuthViewController: UIViewController {
    
    private var authView: AuthView {
        guard let view = self.view as? AuthView else {
            let correctView = AuthView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: AuthViewOutput?
    
    override func loadView() {
        super.loadView()
        self.view = AuthView(frame: self.view.frame)
        authView.authViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearData()
        authView.subscribeObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        authView.unsubscribeObserver()
    }
    
    private func clearData() {
        authView.userNameTextField.text = ""
        authView.passwordTextField.text = ""
    }
}

extension AuthViewController: AuthViewInput {
    func showAlertController(with error: String) {
        DispatchQueue.main.async {
            self.present(self.authView.presentAlert(error: error),
                         animated: true)
        }
    }
    
    func startShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.authView.activityIndicator.startAnimating()
        }
    }
    
    func stopShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.authView.activityIndicator.stopAnimating()
        }
    }
}

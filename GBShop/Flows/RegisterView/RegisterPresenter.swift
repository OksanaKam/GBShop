//
//  RegisterPresenter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

protocol RegisterViewOutput: AnyObject {
    func registrationButtonTapped(user: User, secondPassword: String)
    func goToLogin()
    func showErrorRegistration(title: String, error: String)
    func registrationSuccess(title: String, message: String)
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func startActivityIndicator()
    func stopActivityIndicator()
}

final class RegisterPresenter {
    
    weak var registrationView: RegisterViewInput?
    var router: RegisterRouterProtocol
    var interactor: RegisterInteractorProtocol
    
    init(interactor: RegisterInteractorProtocol,
         router: RegisterRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension RegisterPresenter: RegisterViewOutput {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    func registrationButtonTapped(user: User, secondPassword: String) {
        interactor.registrationButtonTapped(user: user, secondPassword: secondPassword)
    }
    
    func registrationSuccess(title: String, message: String) {
        registrationView?.showAlertController(with: title, error: message)
    }
    
    func goToLogin() {
        router.presentLoginViewController()
    }
    
    func showErrorRegistration(title: String, error: String) {
        self.registrationView?.showAlertController(with: title, error: error)
    }
    
    func startActivityIndicator() {
        registrationView?.startShowingActivityIndicator()
    }
    
    func stopActivityIndicator() {
        registrationView?.stopShowingActivityIndicator()
    }
}

//
//  UserViewPresenter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 19.01.2023.
//

import UIKit

protocol UserViewOutput: AnyObject {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func changeUserInfo(userInfo: User)
    func showAlertController(title: String, error: String)
}

final class UserViewPresenter {
    
    weak var userViewController: UserViewController?
    var interactor: UserViewInteractorProtocol
    var router: UserViewRouterProtocol
    
    init(interactor: UserViewInteractorProtocol, router: UserViewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension UserViewPresenter: UserViewOutput {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    func changeUserInfo(userInfo: User) {
        interactor.changeUserInfo(userInfo: userInfo)
    }
    
    func showAlertController(title: String, error: String) {
        userViewController?.showAlertController(with: title, error: error)
    }
}

//
//  UserViewInteractor.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

protocol UserViewInteractorProtocol {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    
    func changeUserInfo(userInfo: User)
}

final class UserViewInteractor {
    
    private var textCount = 4
    
    weak var presenter: UserViewOutput?
    
    let networkService: ChangeUserDataRequestFactory
    
    init(networkService: ChangeUserDataRequestFactory) {
        self.networkService = networkService
    }
}

extension UserViewInteractor: UserViewInteractorProtocol {
    func textFieldDelegate(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let text = textField.text
        else { return false }
        let numberOfChars = 19
        setupTextCount(text: text)
        if text.count == textCount && string != "" && text.count < numberOfChars {
            textField.text = text + "-"
            return false
        }
        
        let length = !string.isEmpty ? text.count + 1 : text.count - 1
        if length > numberOfChars {
            return false
        }
        return true
    }
    
    private func setupTextCount(text: String) {
        switch text.count {
        case 1...4 :
            textCount = 4
        case 5...9 :
            textCount = 9
        case 10...14:
            textCount = 14
        case 15...18:
            textCount = 19
        default:
            textCount = 4
        }
    }
    
    func changeUserInfo(userInfo: User) {
        let titleForAlertController = "Error"
        
        guard
            userInfo.email != ""
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "E-mail can`t be empty!")
            return
        }
        
        guard
            userInfo.email.contains("@")
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "Email adress must reproduce @")
            return
        }
        
        guard
            userInfo.name != ""
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "Login can`t be empty!")
            return
        }
        
        guard
            userInfo.password != ""
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "Password or Second password can`t be empty!")
            return
        }
        
        guard
            userInfo.creditCard != ""
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "Credit card can`t be empty!")
            return
        }
        
        guard
            userInfo.creditCard.count == 19
        else {
            self.presenter?.showAlertController(title: titleForAlertController, error: "Number credit card shouldn`t have 16 digits")
            return
        }
        
        UserSession.instance.user = userInfo
        networkService.changeUserData(idUser: UserSession.instance.user.id,
                                      userName: userInfo.name,
                                      password: userInfo.password,
                                      email: userInfo.password,
                                      creditCard: userInfo.creditCard) { response in
            switch response.result {
            case .success(let changeResult):
                if changeResult.result == 1 {
                    self.presenter?.showAlertController(title: "Congratulation", error: "You information has been changed :)")
                } else {
                    self.presenter?.showAlertController(title: titleForAlertController, error: "What`s wrond :(")
                }
            case .failure(let error):
                self.presenter?.showAlertController(title: titleForAlertController, error: error.localizedDescription)
            }
        }
    }
}

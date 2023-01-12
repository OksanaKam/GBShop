//
//  AuthInteractor.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

protocol AuthInteractorProtocol {
    func loginButtonTapped(login: String, password: String)
}

final class AuthInteractor {
    weak var presenter: AuthViewOutput?
    
    let networkService: AuthRequestFactory
    
    init(networkService: AuthRequestFactory) {
        self.networkService = networkService
    }
}

extension AuthInteractor: AuthInteractorProtocol {
    func loginButtonTapped(login: String, password: String) {
        guard
            login != "",
            password != ""
        else {
            self.presenter?.showErrorLogin(error: "You can`t use empty Login or/and Password")
            return
        }
        networkService.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let result):
                guard
                    result.result == 1,
                    let currentUser = result.user
                else {
                    self.presenter?.showErrorLogin(error: "You are not registred :(")
                    return
                    
                }
                UserSession.instance.user = currentUser
                self.presenter?.loginSuccess()
                
            case .failure(let error):
                self.presenter?.showErrorLogin(error: "\(error)")
            }
        }
    }
}

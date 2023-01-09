//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

//
//  RegisterRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory {
    func register(idUser: Int, userName: String, password: String, email: String, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void)
}

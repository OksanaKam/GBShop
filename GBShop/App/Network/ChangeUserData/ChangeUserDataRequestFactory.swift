//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, creditCard: String, completionHandler: @escaping(AFDataResponse<ChangeUserDataResult>) -> Void)
}

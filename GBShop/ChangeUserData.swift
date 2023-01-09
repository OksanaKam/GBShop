//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, completionHandler: @escaping (Alamofire.AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, idUser: idUser, login: userName, password: password, email: email)
        self.request(request: requestModel, completionHandler: completionHandler)
        }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let idUser: Int
        let login: String
        let password: String
        let email: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": login,
                "password": password,
                "email": email,
            ]
        }
    }
}

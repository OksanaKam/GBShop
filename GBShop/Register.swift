//
//  Register.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

class Register: AbstractRequestFactory {
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

extension Register: RegisterRequestFactory {
    func register(idUser: Int, userName: String, password: String, email: String, completionHandler: @escaping (Alamofire.AFDataResponse<RegisterUserResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, idUser: idUser, login: userName, password: password, email: email)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
    
extension Register {
    struct Register: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let idUser: Int
        let login: String
        let password: String
        let email: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": login,
                "password": password,
                "email": email
            ]
        }
    }
}

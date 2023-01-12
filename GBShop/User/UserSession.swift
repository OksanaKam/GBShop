//
//  UserSession.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import Foundation

class UserSession {
    
    static let instance = UserSession()
    
    var user = User(id: -1,
                    login: "",
                    password: "",
                    name: "",
                    lastname: "",
                    email: "",
                    creditCard: "")
}

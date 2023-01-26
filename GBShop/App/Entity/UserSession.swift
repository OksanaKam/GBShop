//
//  UserSession.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import Foundation

class UserSession {
    
    static let instance = UserSession()
    
    var user = User(id: -1,
                    userName: "",
                    password: "",
                    name: "",
                    lastname: "",
                    email: "",
                    creditCard: "")
}

//
//  User.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let userName: String
    let password: String
    let name: String
    let lastname: String
    let email: String
    let creditCard: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case userName = "user_login"
        case password
        case name = "user_name"
        case lastname = "user_lastname"
        case email
        case creditCard
    }
}

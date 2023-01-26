//
//  Category.swift
//  GBShop
//
//  Created by Оксана Каменчук on 25.01.2023.
//

import Foundation

class Category {
    init(id: Int, name: String, selected: Bool = false) {
        self.id = id
        self.name = name
        self.selected = selected
    }
    
    let id: Int
    let name: String
    var selected = false
}

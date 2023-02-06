//
//  BasketDataSingleton.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import Foundation

final class BasketDataSingleton {
    static let shared = BasketDataSingleton()

    private init() {}

    var basketData = [(ProductResult, Int)]()
    var totalPrice = 0.0
    
    func updateTotalPrice() {
        var total = 0.0
        for item in basketData {
            total += Double(item.0.productPrice) * Double(item.1)
        }
        totalPrice = total
    }
}

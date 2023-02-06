//
//  Crashlytics.swift
//  GBShop
//
//  Created by Оксана Каменчук on 06.02.2023.
//

import Foundation

enum CrashlyticsMessages {
    case correctLogin
    case incorrectLogin
    case logout
    case registration
    case openCatalog
    case openProduct
    case addToBasket
    case deleteFromBasket
    case payBasket
    case addReview
}

class CrashlyticsService {
    static let shared = CrashlyticsService()

    private init() {}
    
    func sendReport(action: CrashlyticsMessages) {
        switch action {
        case .correctLogin:
            print("Logged in correctly")
            //Crashlytics.crashlytics().log("Logged in correctly")
        case .incorrectLogin:
            print("Logged in incorrectly")
            //Crashlytics.crashlytics().log("Logged in incorrectly")
        case .logout:
            print("Logged out")
            //Crashlytics.crashlytics().log("Logged out")
        case .registration:
            print("Registration")
            //Crashlytics.crashlytics().log("Registration")
        case .openCatalog:
            print("Catalog opened")
            //Crashlytics.crashlytics().log("Catalog opened")
        case .openProduct:
            print("Product opened")
            //Crashlytics.crashlytics().log("Product opened")
        case .addToBasket:
            print("Added to basket")
            //Crashlytics.crashlytics().log("Added to basket")
        case .deleteFromBasket:
            print("Deleted from basket")
            //Crashlytics.crashlytics().log("Deleted from basket")
        case .payBasket:
            print("Basket payed")
            //Crashlytics.crashlytics().log("Basket payed")
        case .addReview:
            print("Review added")
            //Crashlytics.crashlytics().log("Review added")
        }
    }
}

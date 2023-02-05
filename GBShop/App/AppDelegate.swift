//
//  AppDelegate.swift
//  GBShop
//
//  Created by Оксана Каменчук on 20.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(idUser: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let changeUserData = requestFactory.makeChangeDataUserRequsetFactory()
        changeUserData.changeUserData(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", creditCard: "1234567890123456") { response in
            switch response.result {
            case .success(let changeUserData):
                print(changeUserData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let registration = requestFactory.makeRegisterRequestFactory()
        registration.register(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.getProductData(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let good = requestFactory.makeProductRequestFactory()
        good.getProduct(productId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let reviewGet = requestFactory.makeReviewsRequestFactory()
        reviewGet.approveReview(productId: 123) { response in
            switch response.result {
            case .success(let reviewGet):
                print(reviewGet)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let reviewAdd = requestFactory.makeReviewsRequestFactory()
        reviewAdd.addReview(productId: 123, userName: "Somebody", text: "Хорошие сапоги - надо брать!") { response in
            switch response.result {
            case .success(let reviewAdd):
                print(reviewAdd)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let reviewRemove = requestFactory.makeReviewsRequestFactory()
        reviewRemove.removeReview(productId: 123, userName: "Somebody", reviewId: 123) { response in
            switch response.result {
            case .success(let reviewRemove):
                print(reviewRemove)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let basketGet = requestFactory.makeBasketRequestFactory()
        basketGet.getBasket(idUser: 123) { response in
            switch response.result {
            case .success(let basketGet):
                print(basketGet)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let basketAdd = requestFactory.makeBasketRequestFactory()
        basketAdd.addBasket(productId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let basketAdd):
                print(basketAdd)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let basketDelete = requestFactory.makeBasketRequestFactory()
        basketDelete.deleteBasket(productId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let basketDelete):
                print(basketDelete)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let basketPay = requestFactory.makeBasketRequestFactory()
        basketPay.payBasket(idUser: 123, userCreditCard: 123) { response in
            switch response.result {
            case .success(let basketPay):
                print(basketPay)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


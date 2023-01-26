//
//  ViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func auth(userName: String, password: String) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout(idUser: Int) {
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(idUser: idUser) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUserData(idUser: Int, userName: String, password: String, email: String, creditCard: String) {
        let changeUserData = requestFactory.makeChangeDataUserRequsetFactory()
        changeUserData.changeUserData(idUser: idUser, userName: userName, password: password, email: email, creditCard: creditCard) { response in
            switch response.result {
            case .success(let changeUserData):
                print(changeUserData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registration(idUser: Int, userName: String, password: String, email: String) {
        let registration = requestFactory.makeRegisterRequestFactory()
        registration.register(idUser: idUser, userName: userName, password: password, email: email) { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func catalog(pageNumber: Int, categoryId: Int) {
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.getProductData(pageNumber: pageNumber, categoryId: categoryId) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func good(productId: Int) {
        let good = requestFactory.makeProductRequestFactory()
        good.getProduct(productId: productId) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reviewGet(productId: Int) {
        let reviewGet = requestFactory.makeReviewsRequestFactory()
        reviewGet.approveReview(productId: productId) { response in
            switch response.result {
            case .success(let reviewGet):
                print(reviewGet)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reviewAdd(productId: Int, userName: String, text: String) {
        let reviewAdd = requestFactory.makeReviewsRequestFactory()
        reviewAdd.addReview(productId: productId, userName: userName, text: text) { response in
            switch response.result {
            case .success(let reviewAdd):
                print(reviewAdd)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reviewRemove(productId: Int, userName: String, reviewId: Int) {
        let reviewRemove = requestFactory.makeReviewsRequestFactory()
        reviewRemove.removeReview(productId: productId, userName: userName, reviewId: reviewId) { response in
            switch response.result {
            case .success(let reviewRemove):
                print(reviewRemove)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func basketGet(idUser: Int) {
        let basketGet = requestFactory.makeBasketRequestFactory()
        basketGet.getBasket(idUser: idUser) { response in
            switch response.result {
            case .success(let basketGet):
                print(basketGet)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func basketAdd(productId: Int, quantity: Int) {
        let basketAdd = requestFactory.makeBasketRequestFactory()
        basketAdd.addBasket(productId: productId, quantity: quantity) { response in
            switch response.result {
            case .success(let basketAdd):
                print(basketAdd)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func basketDelete(productId: Int, quantity: Int) {
        let basketDelete = requestFactory.makeBasketRequestFactory()
        basketDelete.deleteBasket(productId: productId, quantity: quantity) { response in
            switch response.result {
            case .success(let basketDelete):
                print(basketDelete)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func basketPay(idUser: Int, userCreditCard: Int) {
        let basketPay = requestFactory.makeBasketRequestFactory()
        basketPay.payBasket(idUser: idUser, userCreditCard: userCreditCard) { response in
            switch response.result {
            case .success(let basketPay):
                print(basketPay)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

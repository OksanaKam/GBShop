//
//  RequestFactory.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.12.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> AuthRequestFactory {
            let errorParser = makeErrorParser()
            return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
        }
        
    func makeChangeDataUserRequsetFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
        
    func makeRegisterRequestFactory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
        
    func makeCatalogRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
        
    func makeProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewsRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Reviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeBasketRequestFactory() -> BasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

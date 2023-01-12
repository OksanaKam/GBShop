//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Оксана Каменчук on 29.12.2022.
//

import XCTest
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct LoginResultStub: Codable {
    let result: Int
    let user: User
}
    
struct LogoutResultStub: Codable {
    let result: Int
}
    
struct RegisterUserResultStub: Codable {
    let result: Int
    let userMessage: String
}
    
struct ChangeUserDataResultStub: Codable {
    let result: Int
}

struct ProductResultStub: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}

struct CatalogDataResultStub: Codable {
    let productId: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case price
    }
}

struct ApproveReviewResultStub: Codable {
    let result: Int
    let approveReview: [Review]
    
    enum CodingKeys: String, CodingKey {
        case result
        case approveReview
    }
}

struct AddReviewResultStub: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

struct RemoveReviewResultStub: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

struct AddBasketResultStub: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

struct DeleteBasketResultStub: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

struct GetBasketResultStub: Codable {
    var amount: Int
    var countGoods: Int
    var contents: [BasketResult]
        
    enum CodingKeys: String, CodingKey {
        case amount
        case countGoods = "count_goods"
        case contents
    }
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

final class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLoginResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<LoginResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLogoutResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/logout.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<LogoutResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRegisterUserResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<RegisterUserResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testChangeUserDataResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<ChangeUserDataResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testProductResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/getGoodById.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<ProductResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCatalogDataResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<CatalogDataResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testApproveReviewResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/approveReview.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<ApproveReviewResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddReviewResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/addReview.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<AddReviewResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRemoveReviewResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<RemoveReviewResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetBasketResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/getBasket.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<GetBasketResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddBasketResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/addToBasket.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<AddBasketResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeleteBasketResult() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/deleteFromBasket.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<DeleteBasketResultStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

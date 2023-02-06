//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Оксана Каменчук on 20.12.2022.
//

import XCTest

final class GBShopUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        print(app.debugDescription)
        
        let appView = app.otherElements["appView"].firstMatch
        
        let loginTextField = appView.textFields["login"].firstMatch
        XCTAssert(loginTextField.exists)
        
        let passwordTextField = appView.secureTextFields["password"].firstMatch
        XCTAssert(passwordTextField.exists)
        
        let loginButton = appView.buttons["loginButton"].firstMatch
        XCTAssert(loginButton.exists)
        
        let registrationButton = appView.buttons["registrationButton"].firstMatch
        XCTAssert(registrationButton.exists)
        
        loginTextField.tap()
        loginTextField.typeText("login")
        
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        loginButton.tap()
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

//
//  CreateAccountTest1.swift
//  TestExperimentsUITests
//
//  Created by Marian Shkurda on 11.09.2025.
//

import Foundation
import XCTest
import TestExperimentsMacros

@GenerateTestFunc([
    ("validTest1", ["name": "John", "secondName": "Doe", "age": 25]),
    ("invalidTest1", ["name": "Jane", "secondName": "Doe", "age": 17]),
    ("validTest2", ["name": "Bob", "secondName": "Snow", "age": 18])
])
final class CreateAccountTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func runTest(params: [String: Any]) {
        guard let name = params["name"] as? String,
              let secondName = params["secondName"] as? String,
              let age = params["age"] as? Int else {
            return XCTFail("Invalid test parameters")
        }
        let fullName = "\(name) \(secondName)"
        
        let usersListPage = UsersListPage(app: app)
        let addUserPage = AddUserViewScreen(app: app)
        
        app.launch()
        usersListPage.tapAddButton()
        
        addUserPage.fillTextFields(name: name, secondName: secondName, age: age.description)
        addUserPage.tapCreateUserButton()
        
        usersListPage.checkCellExists(fullName: fullName, age: age.description)
    }
}

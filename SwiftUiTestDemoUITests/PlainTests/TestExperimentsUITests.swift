//
//  TestExperimentsUITests.swift
//  TestExperimentsUITests
//
//  
//

import XCTest


final class TestExperimentsUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        
        let userName = "First-123"
        let userlastName = "Second"
        let fullName = "\(userName) \(userlastName)"
        let age = "7"
        
        let usersListPage = UsersListPage(app: app)
        let addUserPage = AddUserViewPage(app: app)
        
        app.activate()
        usersListPage.tapAddButton()
        
        addUserPage.fillTextFields(firstName: userName, lastName: userlastName, age: age)
        addUserPage.tapCreateUserButton()
        
        usersListPage.checkCellExists(fullName: fullName, age: age)
    }
}

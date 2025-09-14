//
//  CreateAccountTest_ObjCRuntime.swift
//  TestExperimentsUITests
//
//  Created by Marian Shkurda on 12.09.2025.
//

import XCTest

private let testData: [(String, [String: Any])] = [
    ("validTest1", ["name": "John", "lastName": "Doe", "age": 25]),
    ("invalidTest1", ["name": "Jane", "lastName": "Doe", "age": 17]),
    ("validTest2", ["name": "Bob", "lastName": "Snow", "age": 18])
]

final class CreateAccountTest_ObjCRuntime: ParametrizedTestCase {

    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func runCreateAccountTest(_ params: [String: Any]) {
        guard let name = params["name"] as? String,
              let lastName = params["lastName"] as? String,
              let age = params["age"] as? Int else {
            return XCTFail("Invalid test parameters")
        }
        let fullName = "\(name) \(lastName)"

        let usersListPage = UsersListPage(app: app)
        let addUserPage = AddUserViewPage(app: app)

        app.launch()
        usersListPage.tapAddButton()

        addUserPage.fillTextFields(firstName: name, lastName: lastName, age: age.description)
        addUserPage.tapCreateUserButton()

        usersListPage.checkCellExists(fullName: fullName, age: age.description)
    }

    override class func testMethodSelectors() -> [TestMethodSelectorWrapper] {
        return testData.map { testName, parameter in
            let block: @convention(block) (CreateAccountTest_ObjCRuntime) -> Void = { $0.runCreateAccountTest(parameter) }
            let implementation = imp_implementationWithBlock(block)
            let selectorName = "test_\(testName)_\(parameter.description)"
            let selector = NSSelectorFromString(selectorName)
            class_addMethod(self, selector, implementation, "v@:")
            return TestMethodSelectorWrapper(selector: selector)
        }
    }
}

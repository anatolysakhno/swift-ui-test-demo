//
//  CreateUserTests2.swift
//  SwiftUiTestDemoUITests
//
//  Created by Marian Shkurda on 15.09.2025.
//

import XCTest

final class CreateUserTests2: DemoUiAppTests {
    
    override class var testData: [(String, Any)] {
        [
            ("AdultUser", UserFactory.getUser(age: 25)),
            ("SeniorUser", UserFactory.getUser(age: 70)),
            ("MinorUser", UserFactory.getUser(age: 14))
        ]
    }
    
    override func runTest(_ testData: Any) throws {
        guard let user = testData as? User else {
            XCTFail("Invalid test data")
            return
        }
        let actions: UserActions = try app.start()
        try actions.addUser(user: user)
        XCTAssert(actions.isUserExist(user: user), "User \(user.fullName) should exist")
    }
}

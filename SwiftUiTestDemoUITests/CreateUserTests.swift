//
//  CreateAccountTests.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//
import Foundation
import XCTest
import TestExperimentsMacros

@GenerateTestFunc([
    ("AdultUser",  ["user": UserFactory.getUser(age:25)]),
    ("SeniorUser", ["user": UserFactory.getUser(age:70)]),
    ("MinorUser",  ["user": UserFactory.getUser(age:14)])
])

final class CreateUserTests: DemoUiAppTests {
    func _runTest_(params: [String: Any]) {
        guard let user = params["user"] as? User
               else {
            return XCTFail("Invalid test parameters")
        }
        let actions: UserActions = try! app.start()
        try! actions.addUser(user: user)
        assert(actions.isUserExist(user: user), "User \(user.fullName) should exist")
    }
    
    func runTest(params: [String: Any]) {
        guard let user = params["user"] as? User
               else {
            return XCTFail("Invalid test parameters")
        }
        let actions: UserActions = assertNoThrow(try app.start(), message: "")
        XCTAssertNoThrow(try actions.addUser(user: user), "User was not added")
        XCTAssert(actions.isUserExist(user: user), "User \(user.fullName) should exist")
    }
}

//
//  UsersListPage.swift
//  TestExperimentsUITests
//
//  
//

import XCTest

struct UsersListPage {
    
    let app: XCUIApplication
    
    var addButton: XCUIElement {
        app.buttons["addButton"]
    }
    
    func tapAddButton() {
        XCTAssert(app.waitForExistence(timeout: 3))
        addButton.tap()
    }
    
    func checkCellExists(fullName: String, age: String) {
        XCTAssert(app.staticTexts[fullName].waitForExistence(timeout: 3),
                  "User full name is not presented")
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", age.description)
        let userAgeTextExists = app.descendants(matching: .staticText)
            .matching(identifier: "userAge")
            .element(matching: predicate)
            .waitForExistence(timeout: 3)
        XCTAssert(userAgeTextExists,
                  "User age is not presented")
    }
}

//
//  UsersListScreen.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

//
//  UsersListPage.swift
//  TestExperimentsUITests
//
//
//

import XCTest

class UsersListScreen: DemoUiBaseScreen {
    init(app: DemoUiApp, timeout: TimeInterval = BaseScreen.SCREEN_TIMEOUT) throws {
         try super.init(app:app, trait: app.buttons["addButton"], timeout: timeout)
    }
    
    var addButton: XCUIElement {
        app.buttons["addButton"]
    }
    
    func tapAddButton() throws -> AddUserScreen {
        addButton.tap()
        return try AddUserScreen(app: self.app as DemoUiApp)
    }
    
    func checkCellExists(fullName: String, age: String)-> Bool {
        XCTAssert(app.staticTexts[fullName].waitForExistence(timeout: BaseScreen.ELEMENT_TIMEOUT),
                  "User full name is not presented")
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", age.description)
        let userAgeTextExists = app.descendants(matching: .staticText)
            .matching(identifier: "userAge")
            .element(matching: predicate)
            .waitForExistence(timeout: BaseScreen.ELEMENT_TIMEOUT)
        XCTAssert(userAgeTextExists,
                  "User age is not presented")
        return true
    }
}

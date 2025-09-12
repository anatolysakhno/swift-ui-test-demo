//
//  AddUserViewScreen.swift
//  TestExperimentsUITests
//
//  
//

import XCTest

struct AddUserViewScreen {
    let app: XCUIApplication
    
    var createUserButton: XCUIElement {
        app/*@START_MENU_TOKEN@*/.buttons["createButton"]/*[[".otherElements",".buttons[\"Create\"]",".buttons[\"createButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
    }
    
    var userNameTextField: XCUIElement {
        app.textFields["userNameTextField"]
    }
    
    var userSecondNameTextField: XCUIElement {
        app.textFields["userSecondNameTextField"]
    }
    
    var userAgeTextField: XCUIElement {
        app.textFields["userAgeTextField"]
    }
    
    var errorMessageText: XCUIElement {
        app.staticTexts["formErrorMessage"]
    }
    
    func fillTextFields(name: String, secondName: String, age: String) {
        XCTContext.runActivity(named: activityName("Filling text fields")) { _ in
            XCTAssert(createUserButton.waitForExistence(timeout: 3))
            XCTAssert(createUserButton.isEnabled == false)
            userNameTextField.tap()
            userNameTextField.typeText(name)
            userSecondNameTextField.tap()
            userSecondNameTextField.typeText(secondName)
            userAgeTextField.tap()
            userAgeTextField.typeText(age)
            XCTAssert(createUserButton.isEnabled)
        }
    }
    
    func tapCreateUserButton() {
        createUserButton.tap()
        XCTAssertFalse(errorMessageText.exists, "errorMessageText should not exist")
    }
    
    private func activityName(_ description: String) -> String {
        "[Add New User] - \(description)"
    }
}

//
//  AddUserViewScreen.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

enum ScreenValidationError: Error {
    case AdultsOnly
}

import XCTest

class AddUserScreen: DemoUiBaseScreen {
        init(app: DemoUiApp, timeout: TimeInterval = BaseScreen.SCREEN_TIMEOUT) throws {
             try super.init(app:app, trait: app/*@START_MENU_TOKEN@*/.buttons["createButton"]/*[[".otherElements",".buttons[\"Create\"]",".buttons[\"createButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/, timeout: timeout)
        }
    
    
    var createUserButton: XCUIElement {
        app/*@START_MENU_TOKEN@*/.buttons["createButton"]/*[[".otherElements",".buttons[\"Create\"]",".buttons[\"createButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
    }
    
    var userNameTextField: XCUIElement {
        app.textFields["userNameTextField"]
    }
    
    var userlastNameTextField: XCUIElement {
        app.textFields["userlastNameTextField"]
    }
    
    var userAgeTextField: XCUIElement {
        app.textFields["userAgeTextField"]
    }
    
    var errorMessageText: XCUIElement {
        app.staticTexts["formErrorMessage"]
    }
    
    func fillTextFields(firstName: String, lastName: String, age: String) {
        XCTContext.runActivity(named: activityName("Filling text fields")) { _ in
            XCTAssert(createUserButton.waitForExistence(timeout: 3))
            XCTAssert(createUserButton.isEnabled == false)
            userNameTextField.tap()
            userNameTextField.typeText(firstName)
            userlastNameTextField.tap()
            userlastNameTextField.typeText(lastName)
            userAgeTextField.tap()
            userAgeTextField.typeText(age)
            XCTAssert(createUserButton.isEnabled)
        }
    }
    
    func tapCreateUserButton() throws {
        createUserButton.tap()
        XCTAssertFalse(errorMessageText.exists, "errorMessageText should not exist")
        // to replace assertions with error
        guard !errorMessageText.exists
        else { throw
            ScreenValidationError.AdultsOnly }
    }
       
}

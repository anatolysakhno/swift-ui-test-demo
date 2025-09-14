//
//  UiApplication.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

enum ApplicationError: Error {
    case notImplemented
    case notLaunched
}

class BaseUiApplication: XCUIApplication
{
    func start() throws{
        super.launch()
        let started = waitForExistence(timeout: 3)
        guard started else {
            throw ApplicationError.notLaunched
        }
    }
}

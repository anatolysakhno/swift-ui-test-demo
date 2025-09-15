//
//  DemoUiApp.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

final class DemoUiApp: BaseUiApplication {
    var usersActions: UserActions {
        get throws {
            return try UserActions(app:self, screen: UsersListScreen(app:self))
        }
    }
    
    func start() throws -> UserActions {
        super.launch()
        let started = waitForExistence(timeout: 3)
        guard started else {
            throw ApplicationError.notLaunched
        }
        return try usersActions
    }
}

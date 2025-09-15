//
//  UserActions.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 13.09.2025.
//

class UserActions: DemoUiActions<UsersListScreen> {
    
    override init(app: DemoUiApp, screen: UsersListScreen) {
        super.init(app: app, screen: screen)
    }
    
    func addUser(user: User) throws {
        let addUserScreen = try screen.tapAddButton()
        addUserScreen.fillTextFields(firstName: user.firstName, lastName: user.lastName, age: user.age.description)
        try addUserScreen.tapCreateUserButton()
    }
    
    func isUserExist(user: User) -> Bool {
        return screen.checkCellExists(fullName: user.fullName, age: user.age.description)
    }
}

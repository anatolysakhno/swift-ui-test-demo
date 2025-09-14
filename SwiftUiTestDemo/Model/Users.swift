//
//  Users.swift
//  SwiftUiTestDemo
//
//  
//

import Foundation

@Observable
final class Users {
    
    private(set) var users: [UserModel] = []//usersMock
    
    func addUser(_ user: UserModel) {
        users.append(user)
    }
    
    func remove(indexSet: IndexSet) {
        users.remove(atOffsets: indexSet)
    }
}

private let usersMock: [UserModel] = [
    UserModel(name: "John", lastName: "Smith", age: 27),
    UserModel(name: "Jane", lastName: "Doe", age: 25)
]

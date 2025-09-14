//
//  UserModel.swift
//  SwiftUiTestDemo
//
//

import Foundation

final class UserModel {
    let id: UUID
    let firstName: String
    let lastName: String
    let age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.id = UUID()
        self.firstName = name
        self.lastName = lastName
        self.age = age
    }
}

extension UserModel: Identifiable {

}

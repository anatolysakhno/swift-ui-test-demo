//
//  UserModel.swift
//  SwiftUiTestDemo
//
//

import Foundation

final class UserModel {
    let id: UUID
    let name: String
    let secondName: String
    let age: Int
    
    init(name: String, secondName: String, age: Int) {
        self.id = UUID()
        self.name = name
        self.secondName = secondName
        self.age = age
    }
}

extension UserModel: Identifiable {

}

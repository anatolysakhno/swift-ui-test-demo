//
//  User.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 13.09.2025.
//

final class User {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    var fullName: String {get{
       return "\(firstName) \(lastName)"
    }}
    var ageCategory: String {get{
       return self.age < 18 ? "Minor" : self.age >= 65 ? "Senior" :"Adult"
    }}
}

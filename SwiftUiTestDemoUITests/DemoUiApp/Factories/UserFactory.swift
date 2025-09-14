//
//  UserFactory.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 13.09.2025.
//
import Fakery



final class UserFactory {
    static let faker = Faker(locale: "en-US");
    /// Creates a user with custom values
    static func create(
                       firstName: String,
                       lastName: String,
                       age: Int) -> User {
        return User( firstName: firstName, lastName: lastName, age: age)
    }
    
    /// Creates a user with default values (e.g., for testing)
    static func getMinorUser(age: Int = 17) -> User {
        return User(
            firstName: self.faker.name.firstName(),
            lastName: self.faker.name.lastName(),
                    age: age)
    }
    static func getAdultUser(age: Int = 22) -> User {
        return User(
            firstName: self.faker.name.firstName(),
            lastName: self.faker.name.lastName(),
                    age: age)
                    
    }
    static func getUser(age: Int) -> User {
        return User(
            firstName: self.faker.name.firstName(),
            lastName: self.faker.name.lastName(),
                    age: age)
                    
    }
  
}

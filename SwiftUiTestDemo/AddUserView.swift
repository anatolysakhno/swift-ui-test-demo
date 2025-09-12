//
//  AddUserView.swift
//  SwiftUiTestDemo
//
//  
//

import SwiftUI

struct AddUserView: View {
    
    @Environment(Users.self) private var users
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var secondName: String = ""
    @State private var ageString: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text("Create new user")
                .font(.title)
            if showError {
                Text("Adults only")
                    .accessibilityIdentifier("formErrorMessage")
                    .font(.title2)
                    .padding(4)
                    .background(Color.red)
            }
            Group {
                TextField("Name", text: $name)
                    .accessibilityIdentifier("userNameTextField")
                TextField("Second Name", text: $secondName)
                    .accessibilityIdentifier("userSecondNameTextField")
                TextField("Age", text: $ageString)
                    .accessibilityIdentifier("userAgeTextField")
                    .keyboardType(.numberPad)
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            Group {
                Button("Fill random") {
                    fillRandom()
                }
                .tint(.green)
                Button("Create") {
                    createUser()
                }
                .accessibilityIdentifier("createButton")
                .disabled(!buttonEnabled)
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private var buttonEnabled: Bool {
        !name.isEmpty && !secondName.isEmpty && !ageString.isEmpty
    }
    
    private func createUser() {
        guard let age = Int(ageString) else { return }
        if age < 18 {
            showError = true
            return
        }
        let user = UserModel(name: name, secondName: secondName, age: age)
        users.addUser(user)
        dismiss()
    }
    
    // Testing
    private func fillRandom() {
        let name = "User-\(Int.random(in: 0...1000))"
        let secondName = "Sname-\(Int.random(in: 0...1000))"
        let age = Int.random(in: 18...100).description
        self.name = name
        self.secondName = secondName
        self.ageString = age
    }
}

#Preview {
    AddUserView()
        .environment(Users())
}

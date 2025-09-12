//
//  UserCellView.swift
//  SwiftUiTestDemo
//
//  
//

import SwiftUI

struct UserCellView: View {
    
    let user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(user.name) \(user.secondName)")
                .accessibilityIdentifier("userFullName")
                .font(.title3)
            Text("Age: \(user.age)")
                .accessibilityIdentifier("userAge")
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    UserCellView(user: UserModel(name: "First", secondName: "Last", age: 27))
}

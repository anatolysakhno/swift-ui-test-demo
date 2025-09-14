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
            Text("\(user.firstName) \(user.lastName)")
                .accessibilityIdentifier("userFullName")
                .font(.title3)
            Text("Age: \(user.age)")
                .accessibilityIdentifier("userAge")
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    UserCellView(user: UserModel(name: "First", lastName: "Last", age: 27))
}

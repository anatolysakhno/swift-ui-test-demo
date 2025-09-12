//
//  UsersList.swift
//  SwiftUiTestDemo
//
//  
//

import SwiftUI

struct UsersList: View {
    
    @Environment(Users.self) private var users
    @State private var showAddUserSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users.users) { user in
                    UserCellView(user: user)
                }
                .onDelete { indexSet in
                    delete(indexSet: indexSet)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showAddUserSheet = true
                    }
                    .accessibilityIdentifier("addButton")
                }
            }
            .sheet(isPresented: $showAddUserSheet) {
                AddUserView()
            }
        }
    }
    
    private func delete(indexSet: IndexSet) {
        users.remove(indexSet: indexSet)
    }
}

#Preview {
    UsersList()
        .environment(Users())
}

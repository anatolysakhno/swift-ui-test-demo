//
//  ContentView.swift
//  SwiftUiTestDemo
//
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UsersList()
            .environment(Users())
    }
}

#Preview {
    ContentView()
}

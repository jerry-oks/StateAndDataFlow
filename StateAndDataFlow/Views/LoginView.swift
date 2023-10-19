//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var storageManager: StorageManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                Text(name.count.formatted())
                    .foregroundStyle(userManager.nameIsValid(name) ? .green : .red)
                    .bold()
                    .padding(.trailing, 15)
            }
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!userManager.nameIsValid(name))
        }
    }
    
    private func login() {
        if userManager.nameIsValid(name) {
            userManager.user = User(name: name, isLoggedIn: true)
            storageManager.save(user: userManager.user)
        }
    }
}

#Preview {
    LoginView()
}

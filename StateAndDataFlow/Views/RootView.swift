//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var storageManager = StorageManager.shared
    @StateObject private var userManager = UserManager(
        user: StorageManager.shared.getUser()
    )
    
    var body: some View {
        Group {
            if userManager.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager)
        .environmentObject(storageManager)
    }
}

#Preview {
    RootView()
}

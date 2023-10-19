//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by HOLY NADRUGANTIX on 19.10.2023.
//

import SwiftUI

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    @AppStorage("name") var name = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    private init () {}
    
    func getUser() -> User {
        User(name: name, isLoggedIn: isLoggedIn)
    }
    
    func save(user: User) {
        name = user.name
        isLoggedIn = user.isLoggedIn
    }
    
    func deleteUser() {
        name = ""
        isLoggedIn = false
    }
}

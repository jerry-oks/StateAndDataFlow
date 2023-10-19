//
//  User.swift
//  StateAndDataFlow
//
//  Created by HOLY NADRUGANTIX on 19.10.2023.
//

import Foundation

final class User {
    @Published var isLoggedIn = false
    var name: String
    
    init(name: String, isLoggedIn: Bool) {
        self.name = name
        self.isLoggedIn = isLoggedIn
    }
}

//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

final class UserManager: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func nameIsValid(_ name: String) -> Bool {
        name.count > 2
    }
}

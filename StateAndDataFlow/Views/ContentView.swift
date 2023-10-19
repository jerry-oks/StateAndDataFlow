//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            TimerButtonView(timer: timer)
            
            Spacer()
            
            LogOutButtonView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager(user: User(name: "Tim Cook", isLoggedIn: true)))
}

struct TimerButtonView: View {
    let timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct LogOutButtonView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var storageManager: StorageManager
    
    var body: some View {
        Button(action: logOut) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
    
    func logOut() {
        userManager.user.isLoggedIn.toggle()
        storageManager.deleteUser()
    }
}

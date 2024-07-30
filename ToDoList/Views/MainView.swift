//
//  ContentView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if(!viewModel.isSignedIn || viewModel.currentUserID == "") {
            LoginView()
        } else {
            TabView {
                ToDoListItemsView(userID: viewModel.currentUserID)
                    .tabItem { Label("Home", systemImage: "house") }
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
            }
            
        }
        
    }
}

#Preview {
    MainView()
}

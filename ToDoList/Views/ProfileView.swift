//
//  ProfileView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        if let user = viewModel.user {
            
        VStack(spacing: 30) {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            //details
            VStack(alignment: .leading){
                HStack {
                    Text("Name: ")
                        .bold()
                    Spacer()
                    Text(user.name)
                }
            }
            
            VStack(alignment: .leading){
                HStack {
                    Text("Email: ")
                        .bold()
                    Spacer()
                    Text(user.email)
                }
            }
            
            VStack(alignment: .leading){
                HStack {
                    Text("Member Since: ")
                        .bold()
                    Spacer()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
            
            TLButton(text: "Logout", color: .pink) {
                viewModel.logOut()
            }
            
            
            
            Spacer()
        }
        .padding()
        } else {
            Text("Loading...")
        }
       
    }
}

#Preview {
    ProfileView()
}

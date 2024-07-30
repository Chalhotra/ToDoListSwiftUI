//
//  RegisterView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
  
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Start Organizing ToDos", themeColor: .orange, rotationAngle: Angle(degrees: -15))
                .padding(EdgeInsets(top: -130, leading: 0, bottom: 100, trailing: 0))
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                TLButton(text: "Register", color: .orange) {
                    viewModel.register()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}

//
//  LoginView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                //Header
                
                HeaderView(title: "To Do List", subtitle: "Get Things Done", themeColor: .pink, rotationAngle: Angle(degrees: 15))
                    .padding(EdgeInsets(top: -130, leading: 0, bottom: 100, trailing: 0))
                
                
                
                
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        Button(action: {
                            viewModel.login()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.pink)
                                    .frame(height: 50)
                                Text("Login")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20, weight: .bold))
                                
                            }
                                
                        })
                        
                        }
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                        .foregroundStyle(.pink)
                        
                    }
                //Create account
                
                    
                    
                
                Spacer()
            }
        }
    }
}
#Preview {
    LoginView()
}




//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    func login () {
        
        
        guard validate() else{
            return
            
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validate () -> Bool {
        errorMessage = ""
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||  password.trimmingCharacters(in: .whitespaces).isEmpty  {
            errorMessage = "Please fill out all the fields"
            return false
            }
        if !email.contains("@") || !email.contains(".") {
            errorMessage = "Please enter a valid email address!"
            return false
                
        }
        return true
        
    }
}





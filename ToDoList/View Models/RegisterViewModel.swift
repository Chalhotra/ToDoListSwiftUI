//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register () {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
            
        }
        
        
        
    }
    
    private func insertUserRecord (id: String) {
        let newUser = User(id: id,
                       name: name,
                       email: email,
                       joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        if email.trimmingCharacters(in: .whitespaces).isEmpty || name.trimmingCharacters(in: .whitespaces).isEmpty ||  password.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please fill out all the fields!"
            return false
        }
        
        if !(email.contains(".") && email.contains("@")) {
            errorMessage = "Please enter a valid email address"
            return false
        }
        return true
    }
    
    
    
    
}

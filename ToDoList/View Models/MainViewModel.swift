//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserID  = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        })
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
    }
}

//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ProfileViewModel: ObservableObject {
    init () 
    {
        fetchUser()
    }
    
    @Published var user: User? = nil
    
    let db = Firestore.firestore();
    
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        db.collection("users")
            .document(userID)
            .getDocument { [weak self] snapshot, err in
                guard let data = snapshot?.data(), err == nil else {
                    return
                }
                
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    
    func logOut () {
        do {
            
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
   
    
}

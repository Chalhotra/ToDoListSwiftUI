//
//  ToDoListItemsViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemsViewModel: ObservableObject {
    @Published var isShowingItemView = false
    private var userID = Auth.auth().currentUser?.uid ?? ""
    init () {}
    
    func delete(id : String) {
    
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("To Do")
            .document(id)
            .delete()
        
    }
}

//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 15/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemViewModel: ObservableObject {
    
    init () {}
    func toggleIsDone(item: ToDoItem) {
        var itemCopy = item
        itemCopy.isCompleted = !(item.isCompleted)
        
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        db.collection("users")
            .document(userID)
            .collection("To Do")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}

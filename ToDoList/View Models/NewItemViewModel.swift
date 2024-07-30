//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var duedate = Date()
    @Published var showAlert = false
    init () {}
    
    
    func save () {
        //get current user's id
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        //set model values
        let todo_uid = UUID().uuidString
        let newItem = ToDoItem(id: todo_uid,
                               title: title,
                               dueDate: duedate.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               isCompleted: false
        )
        //set values in the db
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("To Do")
            .document(todo_uid)
            .setData(newItem.asDictionary())
    }
    
    var canSave : Bool {
        if(title.isEmpty || duedate <= Date().addingTimeInterval(-86400)  ) {
            return false
        }
        return true
    }
}
// structs @State @Binding @Stateobject @ObservedObject

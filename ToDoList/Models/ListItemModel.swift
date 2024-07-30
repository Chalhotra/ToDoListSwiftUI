//
//  ListItemModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation 


struct ToDoItem: Codable, Identifiable {
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func completionStatus(_ status: Bool) {
        isCompleted = status
    }
}

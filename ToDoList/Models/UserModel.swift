//
//  UserModel.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import Foundation


struct User: Codable {
    let id : String
    let name: String
    let email: String
    let joined: TimeInterval
}

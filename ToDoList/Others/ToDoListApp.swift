//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

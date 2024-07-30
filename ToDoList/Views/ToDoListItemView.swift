//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 15/07/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoItem
    var body: some View {
        
        
        HStack {
            VStack {
                
            }
           
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            
            
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoItem(id: "0", title: "sample", dueDate: Date().timeIntervalSince1970, createdDate: Date().addingTimeInterval(86400).timeIntervalSince1970, isCompleted: true))
}

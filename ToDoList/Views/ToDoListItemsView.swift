//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift
struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemsViewModel()
    @FirestoreQuery var items: [ToDoItem]
    init (userID: String) {
        
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/To Do")
    }
    

    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("To Do List")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Spacer()
                    Button {
                        viewModel.isShowingItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $viewModel.isShowingItemView, content: {
                        NewItemView(isPresentingView: $viewModel.isShowingItemView)
                    })
                    
                    

                }
                
                .padding()
                
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            TLButton(text: "Delete", color: .red) {
                                viewModel.delete(id: item.id)
                                
                            }
                            .tint(.red)
                        }
                }
                Spacer()
            }
                
        }
        
       
    }
}

#Preview {
    ToDoListItemsView(userID: "A8IPiywWOcShcpvlyhkwVm2OqZY2")
}

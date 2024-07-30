//
//  NewItemView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 09/07/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var isPresentingView : Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32, weight: .bold))
                .padding()
            
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.duedate)
                    .datePickerStyle(.graphical)
                TLButton(text: "Save", color: .pink) {
                    if(viewModel.canSave){
                        viewModel.save()
                        isPresentingView = false
                    } else {
                        viewModel.showAlert = true
                    }
                        
                        
                    
                    
                }
                .alert("Error", isPresented: $viewModel.showAlert) {
                    
                Text("fill out all the fields")
                }
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    NewItemView(isPresentingView: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}

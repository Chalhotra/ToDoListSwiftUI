//
//  TLButton.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 12/07/24.
//

import SwiftUI

struct TLButton: View {
    
    var text : String
    var color: Color
    var action: () -> Void
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color)
                    .frame(height: 50)
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                
            }
        }
    }
}

#Preview {
    TLButton(text: "button", color: .blue, action: {
        print("yes")
    })
}

//
//  HeaderView.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 12/07/24.
//

import SwiftUI

struct HeaderView: View {
    var title : String
    var subtitle: String
    var themeColor: Color
    var rotationAngle: Angle
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(themeColor)
                
                .rotationEffect(rotationAngle)
            
            VStack{Text(title)
                    .font(.system(size: 50))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .padding(.top, 50)
                Text(subtitle)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    
            }
        }
        .frame(width: UIScreen.main.bounds.width*1.7)
        .frame(height: 350)
    }
}

#Preview {
    HeaderView(title: "sampleTitle", subtitle: "sampleSubTitle", themeColor: .pink, rotationAngle: Angle(degrees: 15))
}

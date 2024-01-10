//
//  TextFieldModifer.swift
//  Gains
//
//  Created by Developer on 1/5/24.
//


import SwiftUI

struct TextFieldModifer: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color("DarkBlack"))
        //  need to find darker gray almost black
            .cornerRadius(10)
            .padding(.horizontal, 16)
            .padding(.top)
            .foregroundColor(.white)
    }
}

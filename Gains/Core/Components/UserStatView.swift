//
//  UserStatView.swift
//  gains
//
//  Created by Developer on 1/10/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(title)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .frame(width: 100)
    }
}

#Preview {
    UserStatView(value: 12, title: "Posts")
}

//
//  ActiveNowView.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//  NOT USING
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32) {
                ForEach (0 ... 10, id: \.self) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            CircularProfileImageView(user: User.MOCK_USERS[1], size: .large)
                        
                            ZStack {
                                    Circle()
                                    .fill(Color("DarkBlack"))
                                        .frame(width:18, height: 18)
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width:12, height: 18)
                            }
                        }
                        
                        Text("Kevin")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}

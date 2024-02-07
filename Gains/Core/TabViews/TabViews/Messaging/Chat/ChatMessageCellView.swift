//
//  ChatMessageCellView.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import SwiftUI

struct ChatMessageCellView: View {
    let message: Message
    
    private var isFromCurrentUser: Bool {
        return message.isFromCurrentUser
    }
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(.bloodRed)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }
            else {
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: message.user ?? User.MOCK_USERS[0], size: .xxSmall)
                    Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color("CloudWhite"))
                    .foregroundColor(.black)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                
                Spacer()
            }
                
                
            }
        }
        .padding(.horizontal, 8)
    }
}
//
//#Preview {
//    ChatMessageCellView(isFromCurrentUser: true)
//}

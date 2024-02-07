//
//  ChatView.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject  var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                //header
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        if let fullname = user.fullname {
                        Text(fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        }
                        else {
                            Text(user.username)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        
                        Text("Gains")
                            .font(.footnote)
                            .foregroundColor(.cloudWhite)
                    }
                }
                
                
                //messages
                ForEach(viewModel.messages) { message in
                    ChatMessageCellView(message: message)
                }
                
                
            }
            Spacer()
            //message input
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color("CloudWhite"))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }
            label: {
                Text("Send")
                    .fontWeight(.semibold)
                    .foregroundColor(.bloodRed)
            }
            .padding(.horizontal)
            }
            .padding()
        }
        .background(Color("DarkBlack"))
    }
}

#Preview {
    ChatView(user: User.MOCK_USERS[0])
}

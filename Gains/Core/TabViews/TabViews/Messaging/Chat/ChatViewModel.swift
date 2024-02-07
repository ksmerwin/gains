//
//  ChatViewModel.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
   
    let service: MessageService

    init(user: User) {
        self.service = MessageService(chatPartner: user)
        observeMessages()
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
    
    func observeMessages() {
        service.observeMessage() { messages in
            self.messages.append(contentsOf: messages)
            
        }
    }
}

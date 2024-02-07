//
//  InboxViewModel.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore

class InboxViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let service = InboxService()
    
    init() {
        setupSubscribers()
        service.observeRecentMesssages()
        
    }
    
    private func setupSubscribers(){
        service.$docChanges.sink {[weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
        
        
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            
            UserService.fetchUserSnapshot(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                
                
                
                if let messageExists = self.getMessage(withID: message.id) {
                    self.recentMessages[messageExists] = messages[i]
                }
                else {
                    self.recentMessages.append(messages[i])
                }
            }
        }
    }
    
    private func getMessage(withID id: String) -> Int? {
        if let index = self.recentMessages.firstIndex(where: { $0.id == id }) {
            return index
        }
        return nil
    }
    
    
    
}


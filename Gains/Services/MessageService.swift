//
//  MessageService.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import Foundation
import FirebaseFirestore

struct MessageService {
    
    let messagesCollection = Firestore.firestore().collection("messages")
    
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthService.shared.currentUser?.id else { return }
        let chatPartnerId = chatPartner.id
        
        let currentUserRef = messagesCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = messagesCollection.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentUserRef = messagesCollection.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef =  messagesCollection.document(chatPartnerId).collection("recent-messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageText: messageText,
            timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)
        
    }
    
    func observeMessage(completion: @escaping([Message]) -> Void) {
        guard let currentUid = AuthService.shared.currentUser?.id else { return }
        let chatPartnerId = chatPartner.id
        
        
        let query = messagesCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else {return}
            var messages = changes.compactMap({try? $0.document.data(as:Message.self)})
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}

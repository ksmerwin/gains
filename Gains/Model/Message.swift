//
//  Message.swift
//  Gains
//
//  Created by Developer on 2/6/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == AuthService.shared.currentUser?.id ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId == AuthService.shared.currentUser?.id
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}

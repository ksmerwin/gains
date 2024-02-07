//
//  InboxService.swift
//  Gains
//
//  Created by Developer on 2/7/24.
//

import Foundation
import Firebase
import FirebaseFirestore


class InboxService {
    let messagesCollection = Firestore.firestore().collection("messages")
    
    @Published var docChanges = [DocumentChange]()
    
    func observeRecentMesssages() {
        guard let uid = AuthService.shared.currentUser?.id else { return }
        
        let query = messagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return }
            self.docChanges = changes
        }
    }
    
}

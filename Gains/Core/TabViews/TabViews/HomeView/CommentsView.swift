//
//  CommentView.swift
//  Gains
//
//  Created by Developer on 2/22/24.
//

import SwiftUI

struct CommentsView: View {
    @State var showDeleteConfirm = false
    
    @Binding var selectedComment: Comment?
    @Binding var comments: [Comment]
    @Binding var newComment: String
    
    @State private var currentUserId = AuthService.shared.currentUser?.id
    
    var addComment: () -> Void
    var deleteComment: () -> Void
    
    var body: some View {
        VStack {
            Text("Comments")
                .padding(.top)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            List {
                ForEach(comments, id: \.id) { comment in
                    HStack {
                        if let user = comment.user {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                if let user = comment.user {
                                    Text(user.username)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.white)
                                        .padding(.leading)
                                }
                                Text(comment.timestampString)
                                    .fontWeight(.light)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                
                                Spacer()
                                
                            }
                            
                            VStack(alignment: .leading) {
                                Text(comment.commentText)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                if (comment.authorId == currentUserId) {
                                HStack{
                                    
                                    Spacer()
                                        
                                        Button { print("delete: \(comment.commentText)")
                                            selectedComment = comment
                                            showDeleteConfirm.toggle()
                                        }
                                    label: {
                                        Text("Delete")
                                            .font(.caption)
                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
                                    }
                                    .buttonStyle(.borderless)
                                    .padding(.trailing)
                                    }
                                }
                                else {
                                    Spacer()
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                .alert("Delete Comment?", isPresented: $showDeleteConfirm) {
                    Button {
                        self.deleteComment()
                        showDeleteConfirm.toggle()
                    } label: {Text("Confirm")}
                    Button("Cancel", role: .cancel) {
                        showDeleteConfirm.toggle()
                        selectedComment = nil
                    }
                }
                .listRowBackground(Color("DarkBlack"))
                
                
            }
            .listStyle(PlainListStyle())
            .background(.darkBlack)
            
            Spacer()
            //message input
            ZStack(alignment: .trailing) {
                TextField("Comment...", text: $newComment, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color("CloudWhite"))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    Task {addComment()}
                }
            label: {
                Text("Post")
                    .fontWeight(.semibold)
                    .foregroundColor(.bloodRed)
            }
            .padding(.horizontal)
            .disabled(newComment.isEmpty)
            }
            .background(.darkBlack)
            
            .padding()
            
        }
        .background(.darkBlack)
        
    }
    
}


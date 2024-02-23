//
//  FeedCell.swift
//  Gains
//
//  Created by Developer on 1/9/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {

    @StateObject var viewModel: PostCellViewModel
    @State private var showComments = false
    
    
    init(post: Post) {
    self._viewModel = StateObject(wrappedValue: PostCellViewModel(post: post))
    }
    
    var body: some View {
        VStack {
            
            Text("\(viewModel.post.caption)")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.top)
                
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width:380, height: 350)
                .cornerRadius(10)
            
            
            
            
            HStack {
                
                Button{
                    viewModel.post.didLike ?? false ? viewModel.unlikePost() : viewModel.likePost()
                } label: {
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.post.didLike ?? false ? Color(.systemRed) : Color(.systemGray))
                }
                
                
                // likes label
                Text("\(viewModel.post.likes) \(viewModel.post.likes == 1 ? "like" : "likes")")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
                
                
                Spacer()
                VStack{
                    Button{
                        Task {try await viewModel.fetchComments()}
                        showComments.toggle()
                        
                    } label: {
                        
                    Text("\(viewModel.post.comments) \(viewModel.post.comments == 1 ? "comment" : "comments")").fontWeight(.semibold)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    }
                    
                    
                    
                    
                    
                    
                }
            }
            .font(.footnote)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
            
            
            
        }
        .sheet(isPresented: $showComments, content: {
            CommentsView(selectedComment: $viewModel.selectedComment, comments: $viewModel.comments, newComment: $viewModel.newComment, addComment: commentOnPost, deleteComment: deleteComment )
         .presentationDragIndicator(.visible)
        })
        .background(Color.black)
    }
    
    func commentOnPost(){
        viewModel.commentOnPost()
    }
    
    func deleteComment(){
        viewModel.deleteComment()
    }
    
}



#Preview {
    FeedCell(post: Post.MOCK_POSTS[4])
    
}

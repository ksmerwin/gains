//
//  ProfilePostsView.swift
//  Gains
//
//  Created by Developer on 1/19/24.
//

import SwiftUI

struct ProfilePostsView: View {
    @StateObject var viewModel: ProfileViewModel
    
    @Environment(\.dismiss) var dismiss
    init(user: User) {

        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        }
    
    var body: some View {
//        NavigationStack {
            ScrollView {
                LazyVStack() {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading)  {
//                    Image(systemName: "chevron.left")
//                        .imageScale(.large)
//                        .onTapGesture {
//                            dismiss()
//                        }
//                }
//            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Color.black)
            .background(Color.black)
        }
//    }
       
}

#Preview {
    ProfilePostsView(user: User.MOCK_USERS[0])
}

//
//  HomeView.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    init() {
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack() {
                    ForEach(viewModel.posts) { post in
                        NavigationLink(value: post) {
                            UserPostHeaderView(post: post)
                        }
                        FeedCell(post: post)
                    }
                    
                }
            }
            .navigationDestination(for: Post.self, destination: { post in
                if let user = post.user {
                    ProfileView(user: user)
                }
                
            }
                                   
                                   
            )
            
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        InboxView()
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Color.black)
        }
        .background(Color.black)
    }
    
}

#Preview {
    HomeView()
}

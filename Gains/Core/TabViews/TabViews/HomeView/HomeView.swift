//
//  HomeView.swift
//  Gains
//
//  Created by Developer on 1/8/24.
//

import SwiftUI

struct HomeView: View {
    
    init() {

            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack() {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
//
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
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

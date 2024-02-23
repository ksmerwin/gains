//
//  SearchView.swift
//  Gains
//
//  Created by Developer on 2/12/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack (spacing: 12 ) {
                    ForEach(viewModel.filteredUsers) {user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                    
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                    }
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $viewModel.searchText, prompt:"Search...")
                
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .background(Color("DarkBlack"))
            .navigationTitle("Search Lifter")
            .navigationBarTitleDisplayMode(.inline)
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(Color("DarkBlack"), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .background(Color.black)
        }
    }
}

#Preview {
    SearchView()
}

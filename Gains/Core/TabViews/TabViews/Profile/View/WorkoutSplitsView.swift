//
//  WorkoutSplitsView.swift
//  Gains
//
//  Created by Developer on 1/31/24.
//

import SwiftUI

struct WorkoutSplitsView: View {
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
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(viewModel.workoutSplits, id: \.name) { split in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(split.name)
                                .font(.headline)
                            if let desc = split.description {
                                Text(desc)
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                                Spacer()
                            }
                        }
                        .frame(minWidth: 140)
                        .frame(minHeight: 100)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("CloudWhite")))
                    }
                }
                .padding()
                
                
            }
            .background(Color.black)
            .navigationTitle("Workout Splits")
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
    WorkoutSplitsView(user: User.MOCK_USERS[0])
}

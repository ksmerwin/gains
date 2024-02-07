//
//  MiniWorkSplitView.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import SwiftUI

struct MiniWorkSplitView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    
    
    var body: some View {
        HStack {
            if (viewModel.workoutSplits.isEmpty){
                Image(systemName: "figure.core.training")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 175, height: 150)
                    .clipped()
                    .foregroundColor(.white)
                Image(systemName: "figure.cross.training")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 175, height: 150)
                    .clipped()
                    .foregroundColor(.white)
            }
            else {

                ForEach(viewModel.workoutSplits.prefix(2)) { split in
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
            
        }
    }
}





#Preview {
    MiniWorkSplitView(user: User.MOCK_USERS[0])
}

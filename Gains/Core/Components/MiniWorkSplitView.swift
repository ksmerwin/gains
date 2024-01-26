//
//  MiniWorkSplitView.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import SwiftUI

struct MiniWorkSplitView: View {
    let split: WorkoutSplit
    var body: some View {
        ZStack {
            
        
        
            VStack(alignment: .center) {
            Text(split.name)
                .font(.headline)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(2)
        
                if let description = split.description {
                    
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.light)
                }
                
            Spacer()
            
        }
        .padding(20)
        .multilineTextAlignment(.center)
        .background(Color("CloudWhite"))
    }
        .frame(width: 175, height: 150)
        .border(Color("DarkBlack"))
        .cornerRadius(25)
    }
}

    


#Preview {
    MiniWorkSplitView(split: WorkoutSplit.MOCK_WORKOUT_SPLIT[0])
}

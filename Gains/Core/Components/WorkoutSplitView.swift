//
//  WorkoutSplitView.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import SwiftUI

private let daysOfTheWeek = ["Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

struct WorkoutSplitView: View {
    let split:WorkoutSplit
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    var body: some View {
        
        VStack {
            ScrollView {
                VStack {
                    
                    
                    Text(split.name)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                    
                    if let description = split.description {
                        
                        Text(description)
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                }
                .padding()
                
                
                
                LazyVGrid(columns: columns) {
                    ForEach(split.workouts, id: \.self.id) {workout in
                        WorkoutCardView(workout: workout)
                        Spacer()
                    }
                    .padding()
                }
            }
            
        }
        .background(Color("DarkBlack"))
        
    }
}

#Preview {
    WorkoutSplitView(split: WorkoutSplit.MOCK_WORKOUT_SPLIT[0])
}

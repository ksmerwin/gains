//
//  WorkoutCardView.swift
//  Gains
//
//  Created by Developer on 1/12/24.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
            
            
            VStack {
                Text(workout.dayOfTheWeek.capitalized)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(width: 200, height: 50)
                    .background(Color("DarkBlack"))
                    .cornerRadius(15)
                
                HStack {
                    
                    Text(workout.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                }
                
                // exercises sets and reps
                ForEach(workout.exercises, id: \.self.id) { exercise in
                    HStack {
                        
                        Text(" \(exercise.exercise.name)")                              .foregroundColor(.black)
                            .padding(.vertical,2)
                        Spacer()
                        Text(" \(exercise.sets) x \(exercise.reps)")
                            .foregroundColor(.black)
                            .padding(.vertical,2)
                    }
                }
                
                Spacer()
                
            }
            .padding(20)
            .multilineTextAlignment(.center)
            .background(Color("CloudWhite"))
        }
        .frame(width: 350, height: 500)
        .border(Color("DarkBlack"))
        .cornerRadius(25)
    }
}

#Preview {
    WorkoutCardView(workout: Workout.MOCK_WORKOUT[0])
    
}

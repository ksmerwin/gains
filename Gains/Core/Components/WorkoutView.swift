//
//  WorkoutView.swift
//  Gains
//
//  Created by Developer on 1/26/24.
//

import SwiftUI
//
//struct WorkoutView: View {
//    @Binding var workout: Workout
//    
//    var body: some View {
//        VStack{
//            
//            TextField("Name", text: $workout.name)
//                .foregroundColor(.white)
//                .fontWeight(.semibold)
//            TextField("Day of the week", text: $workout.dayOfTheWeek)
//                .foregroundColor(.gray)
//                .font(.subheadline)
//            ForEach(workout.exerciseSets) { exerciseSet in
//                HStack {
//                Text(exerciseSet.exercise.name)
//                        .foregroundColor(.white)
//                Spacer()
//                Text("\(exerciseSet.sets) x \(exerciseSet.reps)")
//                    .foregroundColor(.white)
//                }
//            }
//            
//        }
//        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .padding(15)
//        .background(Color("DarkBlack"))        
//    }
//}
//
//#Preview {
//    WorkoutView(workout: Workout.MOCK_WORKOUT[3])
//        
//}

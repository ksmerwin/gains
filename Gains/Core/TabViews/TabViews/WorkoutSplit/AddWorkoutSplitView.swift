//
//  AddWorkoutSplitView.swift
//  Gains
//
//  Created by Developer on 1/26/24.
//

import SwiftUI

struct AddWorkoutSplitView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AddWorkoutSplitViewModel
    @State private var showAddWorkout = false
    
    init(split: WorkoutSplit) {
        self._viewModel = StateObject(wrappedValue: AddWorkoutSplitViewModel(split: split))
    }
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Button("Cancel") {
                            dismiss()
                        }
                        .foregroundColor(Color("BloodRed"))
                        Spacer()
                        
                        Text("Add Workout Split")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button {
                            Task {try await viewModel.uploadWorkoutSplit()}
                            dismiss()
                        } label: {
                            //needs conditions for uploading
                            Text("Done")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Color("BloodRed"))
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                }
                
                VStack {
                    EditRowView(title: "Name", placeholder: "Enter the name of the Workout Split", text: $viewModel.split.name)
                    
                    EditRowView(title: "Description",placeholder: "Enter the Description of the Split", text: $viewModel.description)
                    
                    VStack {
                        //                        List {
                        ForEach($viewModel.split.workouts) { workout in
                            WorkoutView(workout: workout)
                            
                            Divider()
                                .background(Color.white)
                            //                            }
                            //                        .onMove(perform: move)
                            //                            .onDelete(perform: deleteItem)
                        }
                        
                        
                        Button(action: {
                            showAddWorkout.toggle()
                        }, label: {
                            VStack {
                                
                                Text("Add Workout")
                                    .foregroundColor(.white)
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .foregroundColor(Color("BloodRed"))
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .clipped()
                            }
                        })
                        
                    }
                    
                }
                .popover(isPresented: $showAddWorkout, content: {
                    AddWorkoutView(viewModel: viewModel)
                        .presentationCompactAdaptation(.fullScreenCover)
                })
            }
            
        }
        .background(Color("DarkBlack"))
    }
    //    func move(from source: IndexSet, to destination: Int) {
    //        workouts.move(fromOffsets: source, toOffset: destination)
    //    }
}



struct WorkoutView: View {
    @Binding var workout: Workout
    
    
    
    
    var body: some View {
        VStack{
            
            
            TextField("Name", text: $workout.name)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Day of the week", text: $workout.dayOfTheWeek)
                .foregroundColor(.gray)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            
            
            ForEach($workout.exerciseSets) { exerciseSet in
                HStack {
                    Text(exerciseSet.wrappedValue.exercise.name)
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        Picker("Sets", selection: exerciseSet.sets) {
                                ForEach(1..<100) {
                                    Text("\($0) sets")
                                        .foregroundColor(.white)
                                }
                            }
                        .pickerStyle(.wheel)
                        .frame(width: 100, height: 50)
                        Picker("Reps", selection: exerciseSet.reps) {
                                ForEach(1..<100) {
                                    Text("\($0) reps")
                                        .foregroundColor(.white)
                                }
                            }
                        .pickerStyle(.wheel)
                        .frame(width: 100, height: 50)
                    }
                }
            }
            
        }
        
        .padding(15)
        .background(Color("DarkBlack"))
    }
}



struct EditRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        
        HStack {
            Text(title)
                .padding(.leading,8)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.white)
            
            Spacer()
            
            HStack{
                TextField(placeholder, text: $text)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250, height: 30)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
    
    
}

#Preview {
    AddWorkoutSplitView(split: WorkoutSplit.MOCK_WORKOUT_SPLIT[2])
}

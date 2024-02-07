//
//  AddWorkoutView.swift
//  Gains
//
//  Created by Developer on 1/29/24.
//

import SwiftUI


struct BodyParts: Identifiable, Hashable{
    let name: String
    let id = UUID()
}

private let categories:[BodyParts] = [
    BodyParts(name:"All"),
    BodyParts(name:"chest"),
    BodyParts(name:"abs"),
    BodyParts(name:"arms"),
    BodyParts(name:"legs"),
    BodyParts(name:"back"),
    BodyParts(name:"shoulders")]


struct AddWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AddWorkoutSplitViewModel
    
    var body: some View {
        VStack{
            
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color("BloodRed"))
                    Spacer()
                    
                    Text("Add Exercises")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button {
                        print("Add")
                        Task {viewModel.addWorkoutToSplit()}
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("BloodRed"))
                    }
                }
                .padding(.horizontal)
                Divider()
            }
            
            List {
                TextField("Search", text: $viewModel.searchString)
                
                Picker("Select Category", selection: $viewModel.categoryFilter) {
                    ForEach(categories, id: \.self.name) { category in
                        Text(category.name.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                
                
                ForEach(viewModel.exercisesByCategory, id: \.self) { exercise in
                    MultipleSelectionRow(
                        exercise: exercise,
                        isSelected: viewModel.selectedExercises.contains(exercise)
                    ) {
                        if viewModel.selectedExercises.contains(exercise) {
                            viewModel.selectedExercises.remove(exercise)
                        } else {
                            viewModel.selectedExercises.insert(exercise)
                        }
                    }
                }
                
                
            }
            .searchable(text: $viewModel.searchString)
            
            Spacer()
        }
        .cornerRadius(5)
        .background(Color("DarkBlack"))
        
        
        
    }
    
    
}


struct MultipleSelectionRow: View {
    var exercise: Exercise
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                VStack(alignment: .leading){
                    Text(exercise.name)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    Text(exercise.category.capitalized)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}
//
//
//#Preview {
//    AddWorkoutView(user: User.MOCK_USERS[0])
//}

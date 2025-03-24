//
//  detailsTraining.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

struct detailsTraining: View {
    var training: TrainingModel
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Button{
                    modelContext.delete(training)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Label {
                        
                    } icon: {
                        Image(systemName: "trash")
                    }
                }
//                ForEach(training.exercises, id: \.self) {
//                    exercise in Text(exercise)
//                }
                List {
                    // Itera sobre cada grupo muscular
                    ForEach(Array(muscleGroups.keys.sorted()), id: \.self) { group in
                        Section(header: Text(group).font(.headline)) {
                            // Itera sobre os exercícios do grupo
                            ForEach(muscleGroups[group]!, id: \.self) { exercise in
                                Text(exercise)
                            }
                        }
                    }            }
            }.navigationTitle(training.name)
        }
    }
}

//#Preview {
//    var training = TrainingModel(name: "juan", exercises: ["Juan", "Juan2"])
//    detailsTraining(training: training)
//}

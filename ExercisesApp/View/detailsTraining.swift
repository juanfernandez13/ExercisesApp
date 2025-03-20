//
//  detailsTraining.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI

struct detailsTraining: View {
    var training: TrainingModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(training.exercises, id: \.self) {
                    exercise in Text(exercise)
                }
            }
        }.navigationTitle(training.name)
    }
}

#Preview {
    var training = TrainingModel(name: "juan", exercises: ["Juan", "Juan2"])
    detailsTraining(training: training)
}

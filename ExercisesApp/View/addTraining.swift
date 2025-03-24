//
//  addTraining.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

struct addTraining: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var trainingName: String = ""
    
    @State var  series =  2
    
    @State var  repetitions =  12
    @State var  name =  "qualquer coisa"
        
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome do treino", text: $trainingName)
                
                ExerciseField(
                    series: $series,
                    repetitions: $repetitions,
                    name: "qualquer coisa"
                )
                
            }.toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newTraining = TrainingModel(
                            name: "Treino 1",
                            groups: ["Grupo 1"],
                            exercises: [
                                Exercise(
                                    name: "Supino",
                                    sets: 3,
                                    repetitions: 12)
                            ]
                        )
                        
                        modelContext.insert(newTraining)
                        dismiss()
                        
                    } label: {
                        Text("Salvar")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        
                        dismiss()
                        
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

#Preview {
    addTraining()
}

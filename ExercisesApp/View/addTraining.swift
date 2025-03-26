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
    @State var groupsTraining: [String] = []
    @State var exercisesTraining: [Exercise] = []
    
    @State var showGroups: Bool = false
    @State var showExercises: Bool = false
    
    
        
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome da ficha", text: $trainingName)
                } header: {
                    Text("Nome da ficha")
                }
                Section {
                    ForEach(groupsTraining, id: \.self) {
                        group in HStack{
                            Text(group)
                            Spacer()
                            Button {
                                groupsTraining.removeAll {
                                    currentTask in currentTask == group
                                }
                            } label: {
                                Image(systemName: "xmark.circle").foregroundStyle(.red)
                            }
                        }
                    }
                    Button {
                        showGroups.toggle()
                    } label: {
                        Label {
                            Text("Adicionar grupo")
                        } icon: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    
                    
                } header: {
                    Text("Grupos musculares")
                }
                
                
                Section{
                    
                    
                    ForEach($exercisesTraining, id: \.self) { $exercise in
                        ExerciseField(exercise: Binding(
                                    get: { exercise },
                                    set: { updatedExercise in
                                        if let index = exercisesTraining.firstIndex(where: { $0.id == exercise.id }) {
                                            exercisesTraining[index] = updatedExercise
                                        }
                                    }
                                ), onRemove: {
                                    exercisesTraining.removeAll { $0.id == exercise.id }
                                })
                    }

                        
                   
                    
                    Button {
                        showExercises.toggle()
                        
                    }label: {
                        Text("Adicionar exercicios")
                    }.disabled(groupsTraining.isEmpty)
                    
                    
                }header: {
                    Text("Exercicios")
                }
                .listRowSeparator(Visibility.visible)
               
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
<<<<<<< Updated upstream
                        var newTraining = TrainingModel(
                            name: trainingName,
                            groups: groupsTraining,
                            exercises: exercisesTraining
=======
                        let newTraining = TrainingModel(
                            name: "Treino A",
                            groups: ["Peito", "Dorsal"],
                            exercises: [
                                Exercise(
                                    name: "Supino reto",
                                    sets: 3,
                                    repetitions: 12),
                                Exercise(
                                    name: "Supino inclinado",
                                    sets: 4,
                                    repetitions: 10),
                                Exercise(
                                    name: "Remada curvada",
                                    sets: 4,
                                    repetitions: 10)
                            ]
>>>>>>> Stashed changes
                        )
                        
                        for i in 0..<newTraining.exercises.count {
                            print(newTraining.exercises[i].name)
                        }
                        
//                        modelContext.insert(newTraining)
//                        
//                        
//                        dismiss()
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
        }.sheet(isPresented: $showGroups, content: {
            selectGroups(selectedGroup: $groupsTraining)
        })
        .sheet(isPresented: $showExercises, content: {
            SelectExercisesSheetContent(selectedGroup: $groupsTraining,selectedExercises: $exercisesTraining)
        })
    }
}

#Preview {
    addTraining()
}

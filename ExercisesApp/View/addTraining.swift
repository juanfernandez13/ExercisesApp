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
            }
            .toolbar {
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
        }.sheet(isPresented: $showGroups, content: {
            selectGroups(selectedGroup: $groupsTraining)
        })
    }
}

#Preview {
    addTraining()
}

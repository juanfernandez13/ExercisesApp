//
//  selectGroups.swift
//  ExercisesApp
//
//  Created by user on 24/03/25.
//

import SwiftUI

struct SelectExercisesSheetContent: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedGroup: [String]
    @Binding var selectedExercises: [Exercise]
    
    var body: some View {
        VStack {
            List {
                Text("Exercícios")
                    .bold()
                    .padding(.bottom, 12)
                    .font(.system(size: 28))
                    .listRowBackground(Color.clear)
                
                
                
                if !selectedGroup.isEmpty {
                    Section(header: Text("Exercícios Selecionados").bold()) {
                        ForEach(getSelectedExercises(), id: \.self) { exercise in
                            Button {
                                if selectedExercises.contains(where: { $0.name == exercise }) {
                                    selectedExercises.removeAll { $0.name == exercise }
                                } else {
                                    selectedExercises.append(Exercise(name: exercise, sets: 4, repetitions: 12))
                                }
                            } label: {
                                HStack {
                                    Image(systemName: selectedExercises.contains(where: { $0.name == exercise }) ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(selectedExercises.contains(where: { $0.name == exercise }) ? .green : .gray)
                                    Text(exercise)
                                }
                            }
                        }
                    }
                }
            }
            
            Button {
                dismiss()
            } label: {
                Text("Confirmar")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    private func getSelectedExercises() -> [String] {
        selectedGroup.flatMap { muscleGroups[$0] ?? [] }
    }
}

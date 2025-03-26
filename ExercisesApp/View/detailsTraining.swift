//
//  detailsTraining.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

struct menuOption: Hashable {
    let text: String
    let icon: String
    
    static func == (lhs: menuOption, rhs: menuOption) -> Bool {
        return lhs.text == rhs.text && lhs.icon == rhs.icon
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(icon)
    }
}

struct detailsTraining: View {
    var training: TrainingModel
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var showEditSheet: Bool = false
    
    var menuOptions: [menuOption] = [
        menuOption(text: "Concluir", icon: "checkmark.square"),
        menuOption(text: "Editar", icon: "pencil.circle"),
        menuOption(text: "Apagar", icon: "trash")
    ]
    
    func deleteTraining() {
        modelContext.delete(training)
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(training.groups, id: \.self){ group in
                        Section(header: Text(group)) {
                            ForEach(training.exercises, id: \.self) { exercise in
                                if((muscleGroups[group] ?? []).contains(exercise.name)){
                                    HStack {
                                        Text(exercise.name)
                                        Spacer()
                                        Text("\(exercise.sets)")
                                        Text("X")
                                        Text("\(exercise.repetitions)")
                                    }
                                }
                            }
                            
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Menu{                            
                            ForEach(menuOptions, id: \.self) { option in
                                Button(role: option.text == "Apagar" ? .destructive : .cancel) {
                                    switch option.text {
                                    case "Apagar":
                                        deleteTraining()
                                    case "Editar":
                                        showEditSheet.toggle()
                                    default:
                                        print(option.text)
                                    }
                                } label: {
                                    Label(option.text, systemImage: option.icon)
                                }
                            }
                        } label: {
                            
                            Image(systemName: "ellipsis.circle")
                            
                        }
                    }
                }
                .sheet(isPresented: $showEditSheet) {
                    addTraining(training: training, isEdit: true)
                }
            }.navigationTitle(training.name)
            
        }
    }
}

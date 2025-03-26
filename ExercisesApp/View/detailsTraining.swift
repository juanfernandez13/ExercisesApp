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
                    //                    Spacer()
                    ToolbarItem(placement: .confirmationAction) {
                        Menu{
                            //                            //modelContext.delete(training)
                            //                            presentationMode.wrappedValue.dismiss()
                           
                            ForEach(menuOptions, id: \.self) { option in
                                Button {
                                    switch option.text {
                                    case "Apagar":
                                        deleteTraining()
                                    default:
                                        print(option.text)
                                    }
                                } label: {
                                    Label(option.text, systemImage: option.icon)
                                        .foregroundColor(option.text == "Apagar" ? .red : .primary)
                                }
                            }
                        } label: {
                            
                            Image(systemName: "ellipsis.circle")
                            
                        }
                    }
                }
            }.navigationTitle(training.name)
        }
    }
}

//#Preview {
//    var training = TrainingModel(name: "juan", exercises: ["Juan", "Juan2"])
//    detailsTraining(training: training)
//}

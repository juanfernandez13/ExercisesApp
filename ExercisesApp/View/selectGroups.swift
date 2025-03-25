//
//  selectGroups.swift
//  ExercisesApp
//
//  Created by user on 24/03/25.
//

import SwiftUI

struct selectGroups: View {
    
    @Environment(\.dismiss) var dismiss

    @Binding var selectedGroup: [String]
    
    
    var body: some View {
        VStack {
            
            List {
                Text("Grupos musculares")
                    .bold()
                    .padding([.bottom], 12)
                    .font(.system(size: 28))
                    .listRowBackground(Color.clear)
                ForEach(muscleGroups.keys.sorted(), id: \.self) {
                    group in HStack {
                        Button {
                            if(selectedGroup.contains(group)) {
                                selectedGroup.removeAll {
                                    currentTask in currentTask == group
                                }
                            } else {
                                selectedGroup.append(group)
                            }
                        } label: {
                            Label {
                                Text(group)
                            } icon: {
                                Image(systemName: selectedGroup.contains(group) ? "checkmark.square.fill" : "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)          .foregroundColor(selectedGroup.contains(group) ? .green : .gray)

                            }
                        }
                    }
                }
            }
            Button {
                dismiss()
            } label: {
                Text("Confirmar")
            }
        }
    }
}

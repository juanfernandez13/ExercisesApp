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
                        Image(systemName: selectedGroup.contains(group) ? "checkmark.square.fill" : "square")                    .foregroundColor(selectedGroup.contains(group)  ? .blue : .gray)

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

#Preview {
    @State var groups = [""]
    selectGroups(selectedGroup: $groups)
}

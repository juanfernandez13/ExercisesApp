//
//  ficha.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

struct ficha: View {
    @Query var Trainings: [TrainingModel]
    
    @State var isPresented: Bool = false
    var body: some View {
        VStack{
            List {
                ForEach(Trainings) {training in
                    NavigationLink {
                        detailsTraining(training: training)
                    } label: {
                        Text(training.name)
                    }
                }
            }
        }.toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    isPresented.toggle()
                }
                    label: {
                            Image(systemName: "plus")
                    }
            }
        }
        .navigationTitle("Ficha")
            .sheet(isPresented: $isPresented, content: {
                addTraining()
            })
            
    }
}

#Preview {
    ficha()
}

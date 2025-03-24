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
                Button {
                    isPresented.toggle()
                } label: {
                    Label {
                        Text("Adicionar treino")
                    } icon: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {}
                    label: {
                        Text("Salvar")
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

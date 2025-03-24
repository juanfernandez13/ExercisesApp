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
            
            if Trainings.isEmpty {
                    VStack {
                        Text("Você ainda não tem nenhuma ficha de treino cadastrada")
                            .font(.title2)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .lineLimit(nil)
                            .padding(.horizontal ,25)
                            .padding(.top,35)
                            .frame(maxWidth: .infinity, minHeight: 48)

                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Text("Cadastrar treino")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.teal)
                                .padding(.top, 3.0)
                        }
                    }
                }
            
           
              
            
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
                        Text("Adicionar")
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

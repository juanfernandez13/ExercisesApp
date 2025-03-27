//
//  ExerciseFields.swift
//  ExercisesApp
//
//  Created by user on 24/03/25.
//

import SwiftUI

struct ExerciseField: View {
    @Binding var exercise: Exercise
    var onRemove: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(exercise.name)
                    .font(.title2)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    onRemove()
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.red)
                }
            }.padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Text("Séries")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                    Stepper(value: $exercise.sets, in: 1...20) {
                        Text("\(exercise.sets)")
                            .font(.title2)
                            .frame(width: 40, alignment: .center)
                    }
                    .padding(.all, 10.0)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .frame(width: 120, height: 38)
                }
                
                HStack {
                    Text("Repetições")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                    Stepper(value: $exercise.repetitions, in: 1...50) {
                        Text("\(exercise.repetitions)")
                            .font(.title2)
                            .frame(width: 40, alignment: .center)
                    }
                    .padding(.all, 10.0)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .frame(width: 120, height: 38)
                }
            }
        }
        .padding()
    }
}



struct ExerciseField_Previews: PreviewProvider {
    @State static var exercise = Exercise(name: "Agachamento", sets: 3, repetitions: 12)

    static var previews: some View {
        ExerciseField(exercise: $exercise,onRemove: {
            print("hello")
        })
    }
}

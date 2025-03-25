//
//  ExerciseFields.swift
//  ExercisesApp
//
//  Created by user on 24/03/25.
//

import SwiftUI

struct ExerciseField: View {
    @Binding var series: Int
    @Binding var repetitions: Int
    var name: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Exercício")
                .font(.headline)
                .foregroundColor(.black)

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 55.0)
                .overlay(
                    HStack {
                        Text(name)
                            .foregroundColor(.teal)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.leading, 10)
                )

            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Séries")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Stepper(value: $series, in: 1...20) {
                        Text("\(series)")
                            .font(.title2)
                            .frame(width: 40, alignment: .center)
                    }
                }

                VStack(alignment: .leading) {
                    Text("Repetições")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Stepper(value: $repetitions, in: 1...50) {
                        Text("\(repetitions)")
                            .font(.title2)
                            .frame(width: 40, alignment: .center)
                    }
                }
            }
        }
        .padding()
    }
}

struct ExerciseField_Previews: PreviewProvider {
    
    @State static var series = 3
    @State static var repetitions = 12
    
    static var previews: some View {
        ExerciseField(
            series: $series,
            repetitions: $repetitions,
            name: "Agachamento"
        )
    }
}

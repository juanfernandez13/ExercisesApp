//
//  CardWorkoutHome.swift
//  ExercisesApp
//
//  Created by user on 26/03/25.
//

import SwiftUI

struct CardWorkoutHome: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "dumbbell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.teal)
                    .padding()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Cardio")
                        .font(.system(size: 20, weight: .medium))
                    
//                    todo add ternarary to personalize done/pedding
                    Button(action: {
                        print("Botão pressionado!")
                    }) {
                        Text("Concluído")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 90, height: 30)
                            .background(.teal)
                            .cornerRadius(5)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.teal)
                    .font(.system(size: 25, weight: .medium))
                    .padding(.trailing)
            }
        }
        .frame(width: 361, height: 87)
        .background(Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.teal, lineWidth: 1)
        )
        
    }
}

#Preview {
    CardWorkoutHome()
}

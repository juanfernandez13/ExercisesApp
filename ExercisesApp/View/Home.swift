//
//  Home.swift
//  ExercisesApp
//
//  Created by user on 20/03/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack() {
                Image(systemName: "square.fill")
                    .resizable()
                    .frame(width: 250, height: 210)
                    .foregroundColor(Color.gray)
                
                Text("Comece um treino e deixe o pet feliz!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity)
                    
                NavigationLink {
                    ficha()
                } label: {
                    Text("Adicionar treino")
                        .frame(width: 350)
                        .foregroundColor(.teal)
                        .bold()
                        .font(.system(size: 20))
                        .padding(.top, 5)
                }.frame(minWidth: 240)
            }.padding(.bottom, 320.0)
        }
    }
}

#Preview {
    Home()
}

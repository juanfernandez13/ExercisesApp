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
                Image("GymTam")
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 308, height: 308)
                  .background(
                    Image("ratinho-feliz-com-peso")
                     
                      .aspectRatio(contentMode: .fill)
                      
                      .clipped()
                  )
                  .border(.yellow, width: 2)
                  .cornerRadius(20)
                
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

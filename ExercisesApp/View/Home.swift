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
                
                Image("GymTam").padding(.bottom,36)

                
                ZStack {
                    HStack {
                        Image("ratinho-pequeno")
                        VStack(alignment: .leading) {
                            Text("Oi, eu sou Tam!")
                                .font(Font.custom("SF Pro", size: 22))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Continue seus treinos!")
                                    .font(Font.custom("SF Pro", size: 16).weight(.bold))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("Você está a 3 dias treinando, mantenha o ritmo!")
                                    .font(Font.custom("SF Pro", size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                    }
                    .frame(width: 370, height: 177)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.orange, lineWidth: 1)
                    )
                }.padding(.bottom,36)
                
               
                VStack{
                    HStack {
                            Text("Treinos")
                              .font(Font.custom("SF Pro Display", size: 24))
                              .foregroundColor(.black)
                              
                            Spacer()
                            Text("Adicionar treino")
                              .font(Font.custom("SF Pro Display", size: 20))
                              .multilineTextAlignment(.trailing)
                              .foregroundColor(.teal)
                              
                    }.padding(.bottom,36)
                    
                    CardWorkoutHome()
                    
                    
                }.padding(.horizontal)
                
                
                
                
                    
                    
             
                

                
//                Text("Comece um treino e deixe o pet feliz!")
//                    .font(.title)
//                    .multilineTextAlignment(.center)
//                    .lineLimit(nil)
//                    .frame(maxWidth: .infinity)
//                    
//                NavigationLink {
//                    ficha()
//                } label: {
//                    Text("Adicionar treino")
//                        .frame(width: 350)
//                        .foregroundColor(.teal)
//                        .bold()
//                        .font(.system(size: 20))
//                        .padding(.top, 5)
//                }.frame(minWidth: 240)
            }.padding(.bottom, 320.0)
        }
    }
}

#Preview {
    Home()
}

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
                HStack {
                    Image(systemName: "face.smiling")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Você treinou hoje")
                }
                .frame(width: 350, height: 100)
                .background(.red)
                
                Spacer()
                
                NavigationLink {
                    ficha()
                } label: {
                    Text("Ver ficha")
                        .frame(width: 350, height:100)
                        .background(.red)
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 24))
                }.frame(minWidth:240)
                
                Spacer()
                
            }.background(.green)
        }
    }
}

#Preview {
    Home()
}

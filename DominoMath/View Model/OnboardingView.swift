//
//  OnboardingView.swift
//  DominoMath
//
//  Created by User on 16/11/23.
//
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 75) {
                Text("Regras")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Cada jogador começa com 6 peças aleatórias.")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    
                    Text("Cada peça tem duas expressões matemáticas, uma em cada ponta.")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    
                    Text("O objetivo é resolver as expressões para encaixá-las na peça determinada.")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    
                    NavigationLink(destination: TelaGame()) {
                        Text("Vamos lá!")
                            .font(.largeTitle) //Aumenta a fonte
                            .foregroundColor(Color(.white))
                            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                            .background(Color(.vermelho))
                            .cornerRadius(35)
                            .font(.system(size:23))
                            .offset(x: 210, y: 20)
                    }
                }
                .offset(y:-50)
            }
        
            .padding(20)
            .background(Color(.cinza))
            .cornerRadius(20)
            
        }
        .cornerRadius(20)
        
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

//extension Color {
//    init(hex: Int, alpha: Double = 1.0) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 8) & 0xff) / 255,
//            blue: Double(hex & 0xff) / 255,
//            opacity: alpha
//        )
//    }
//}


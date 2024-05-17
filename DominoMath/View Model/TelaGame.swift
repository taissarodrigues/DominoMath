//
//  TelaGame.swift
//  DominoMath
//
//  Created by Taissa Vitoria Rodrigues de Paula on 17/05/24.
//

import SwiftUI

struct TelaGame: View {
    
    @State private var isOnboardingDismissed = false
    @State private var isOnboardingPresented = false
    @State private var isGameOverPresented = false
    
    @StateObject var appContext = AppContext.instance
    
    @State var player1Hand: [DominoModel] = []
    @State var player2Hand: [DominoModel] = []
    
    var body: some View {
        
        ZStack {
            
            DominoBoard()
            
            VStack {
                
                Text("Player 2")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.fundoVerde))
                    .cornerRadius(15)
                    .rotationEffect(.degrees(180))
                    .offset(x:-1 , y: -320)
                
                HStack {
                    ForEach($player2Hand) { $dominoset in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            Domino(domino: $dominoset)
                                .rotationEffect(.degrees(180))
                                .transition(.move(edge: .top))
                        }
                    }
                    .offset(y: -UIScreen.main.bounds.height * 0.44)
                }
            }
            VStack {
                Text("Player 1")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.fundoVerde))
                    .cornerRadius(15)
                    .offset(x: 1, y: 445)
                
                HStack {
                    ForEach($player1Hand) { $dominoset in
                        withAnimation(.easeInOut(duration: 0.5)) {
                        Domino(domino: $dominoset)
                    }
                }
                    .offset(y: UIScreen.main.bounds.height * 0.39)
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                if !isOnboardingDismissed {
                    isOnboardingPresented = true
                }
            })
        }
        .sheet(isPresented: $isOnboardingPresented) {
            if #available(iOS 16.4, *) {
                OnboardingView()
                    .presentationBackground(.clear)
                    .onTapGesture {
                        isOnboardingPresented = false
                    }
            } else {
                OnboardingView()
                    .onTapGesture {
                        isOnboardingPresented = false
                    }
            }
        }
        .sheet(isPresented: $isGameOverPresented, onDismiss: {}) { /*[winner]*//* in*/
            if #available(iOS 16.4, *){
                GameOverView(loadHandsHandler: loadHands)
                .presentationBackground(.clear)
            } else {
                GameOverView(loadHandsHandler: loadHands)
            }
            
        }
        .onChange(of: player1Hand) { newValue in
            if newValue.allSatisfy(\.taNaBoard) {
                appContext.winner = "Player 1"
                isGameOverPresented = true
            }
        }
        .onChange(of: player2Hand) { newValue in
            if newValue.allSatisfy(\.taNaBoard) {
                appContext.winner = "Player 2"
                isGameOverPresented = true
            }
        }
        .onAppear {
            loadHands()
        }
    }
    
    func loadHands() {
        player1Hand.removeAll()
        player2Hand.removeAll()
        
        let shuffledDominoes = dominoes.shuffled()
        player1Hand = Array(shuffledDominoes.prefix(6))
        player2Hand = Array(shuffledDominoes.suffix(6))
    }
}



#Preview {
    TelaGame()
}

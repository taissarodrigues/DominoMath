//
//  DominoBoard.swift
//  DominoMath
//
//  Created by user247327 on 15/10/23.
//

import SwiftUI

struct DominoBoard: View {
    var body: some View {
        let boardSize = UIScreen.main.bounds
        let boardWidth = boardSize.width
        let boardHeight = boardSize.height

        ZStack {
            Rectangle()
                .fill(Color(.fundoVerde))
                .edgesIgnoringSafeArea(.all)
                .frame(width: boardWidth * 4, height: boardHeight * 1.0)

            Image("oii")
                //.resizable() // Torna a imagem redimensionável
                .scaledToFit() // Ajusta a imagem mantendo a proporção
                .frame(width: boardWidth * 4, height: boardHeight * 0.5)
                .scaledToFit()
        }
    }
}

struct DominoBoard_Previews: PreviewProvider {
    static var previews: some View {
        DominoBoard()
    }
}


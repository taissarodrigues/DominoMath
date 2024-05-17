import Foundation
import SwiftUI

struct Domino: View {
    
    @State private var angle: Angle = Angle(degrees: 0)

    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    
    var shouldRotateText: Bool {
        return abs(angle.degrees) > 45
    }
    
    @Binding var domino: DominoModel {
        didSet {
            if !domino.taNaBoard {
                angle = .zero
                location = CGPoint(x: 0, y: 0)
            }
        }
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 80, height: 60)
                    .overlay(
                        Text(domino.ladoATexto)
                            .font(.title2)
                            .foregroundColor(Color.black)
                    )
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 80, height: 60)
                    .overlay(
                        Text(domino.ladoBTexto)
                            .font(.title2)
                            .foregroundColor(Color.black)
                    )
            }
            
        }
        .background(Color.black)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 5)
        )
        //DominoRotation
        .rotationEffect(angle)
        .gesture(
            TapGesture(count: 1)
                .onEnded { _ in
                    angle += Angle(degrees: 90)
                }
        )
        //DominoDrag
        .position(location)
        .animation(.spring(duration: 0.6, bounce: 0.3), value: location)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    location = value.location
                }
                .onEnded { value in
                    domino.taNaBoard = true
                }
        )
        .frame(width: 80, height: 120)
        
    }}
//
//struct Domino_Previews: PreviewProvider {
//    static var previews: some View {
//            ForEach(dominoes) { dominoset in
//                Domino(domino: dominoset)
//            }
//        }
//    }

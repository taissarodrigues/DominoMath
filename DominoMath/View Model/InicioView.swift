import SwiftUI

struct InicioView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.fundoVerde)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 800, height: 400)
                    
                    NavigationLink(destination: TelaGame()) {
                        Text("Jogar")
                            .font(.largeTitle)
                            .foregroundColor(Color(.white))
                            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                            .background(Color(.vermelho))
                            .cornerRadius(35)
                            .font(.system(size:23))
                        
                    }
                }
            }
            
        }
    }
}

//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgb: UInt64 = 0
//        
//        scanner.scanHexInt64(&rgb)
//        
//        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgb & 0x0000FF) / 255.0
//        
//        self.init(red: red, green: green, blue: blue)
//    }
//}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}




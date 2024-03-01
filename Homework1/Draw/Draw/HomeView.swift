//
//  HomeView.swift
//  Draw
//
//  Created by deniz yılmaz on 10/16/23.
//


import SwiftUI

struct HomeView: View {
    
    @State private var names = ["Deniz", "Halime", "Eftelya", "Uğur", "Salime", "Kader", "Bulut", "Münüre", "Sare", "Mina"]
    @State private var drawnNames: [String] = []
    @State private var buttonTitle = "DRAW"
    @State private var buttonColor: Color = .blue
    @State private var remainingDraws = 3
    
    var body: some View {
        VStack {
            Text("Draw Application")
                .font(.title)
                .foregroundStyle(Color(red: 1.8, green: 0.1, blue: 0.1))
                .padding(.vertical, 32)
                .padding(.horizontal, 16)
                .bold()
            
            
            // Display all names
            VStack {
                Text("All Names")
                    .font(.title2)
                    .foregroundStyle(.red)
                    .bold()
                
                ForEach(names, id: \.self) { name in
                    Text(name)
                        .padding(.vertical, 5)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            
            Text("Remaining Draws: \(remainingDraws)")
                .font(.title3)
                .foregroundStyle(.red)
                .bold()

            // Display drawn names with a colored background
            HStack {
                ForEach(drawnNames, id: \.self) { name in
                    Text(name)
                        .padding(5)
                        .background((Color(red: 0.8, green: 0.5, blue: 0.4)))
                        .cornerRadius(8)
                }
            }
            .padding()

            Spacer()

            Button(action: playAction) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
            }
            .background(buttonColor)
            .cornerRadius(16)
            .padding(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.2, green: 0.8, blue: 0.8))
    }
    
    func ClearDrawnNamesArray() {
        
        drawnNames.removeAll()
        remainingDraws = 3
    }
    
    func playAction() {
        
        if remainingDraws == 0 {
            ClearDrawnNamesArray()
            buttonTitle = "DRAW"
            buttonColor = .blue
            return
        }
        
        if remainingDraws > 0 {
            let randomIndex = Int.random(in: 0..<names.count)
            let randomName = names[randomIndex]
            
            if !drawnNames.contains(randomName) {
                drawnNames.append(randomName)
                remainingDraws -= 1
            }
            
            buttonTitle = remainingDraws > 0 ? "DRAW" : "CLEAR"
            buttonColor = remainingDraws > 0 ? .blue : .green
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


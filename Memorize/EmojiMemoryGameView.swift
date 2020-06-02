//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nitai Halle on 24/05/2020.
//  Copyright © 2020 Nitai Halle. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiMemoryGame : EmojiMemoryGame //viewModel
    
    var body: some View {
        Grid(emojiMemoryGame.cards) {card in
            CardView(card : card).onTapGesture {
                self.emojiMemoryGame.chooseCard(card: card)
            }
        }.foregroundColor(Color.orange).aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit).padding(2)
    }
}

struct CardView: View{
    var card : MemoryGame<String>.Card
    var body: some View{
        GeometryReader(content :{ geometry in
            ZStack {
                if self.card.isFaceUp{
                    RoundedRectangle(cornerRadius: 10.0).stroke( lineWidth: 5.0)
                    RoundedRectangle(cornerRadius: 10.0).fill().foregroundColor(Color.white)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
                }.font(Font.system(size : min(geometry.size.width, geometry.size.height) * 0.75)).padding(12)
        })
            
        
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
    }
}

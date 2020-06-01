//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nitai Halle on 25/05/2020.
//  Copyright © 2020 Nitai Halle. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    @Published private var memoryGame : MemoryGame<String> = createMemoryGame()//Model
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","☠️","💀"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)){pairsIndex  in emojis[pairsIndex]}
    }
    
    var cards : Array<MemoryGame<String>.Card> {
        memoryGame.cards
        
    }
    func chooseCard(card : MemoryGame<String>.Card){
        memoryGame.choose(card : card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

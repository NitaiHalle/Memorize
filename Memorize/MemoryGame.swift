//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nitai Halle on 25/05/2020.
//  Copyright © 2020 Nitai Halle. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards : Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card : Card){
        print("choose card: \(card)")
        if let chosenIndex = index(of:card){
            cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        }
    }
    
    private func index(of card :Card) -> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    struct Card : Identifiable{
        var id: Int
        var isFaceUp = true
        var isMatch = false
        var content : CardContent
    }
}

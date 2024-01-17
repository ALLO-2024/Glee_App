//
//  MemoryGame.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/15.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards : Array<Card>
    
    func choose(card : Card) {
       
    }
    
    init(numberOfPairsOfCards : Int, cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
        }
    }
    
    struct Card : Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id: Int
    }
}

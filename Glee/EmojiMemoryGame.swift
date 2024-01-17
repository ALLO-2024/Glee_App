//
//  EmojiMemoryGame.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/15.
//

import SwiftUI

class EmojiMemoryGame {
    private(set) var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis : Array<String> = ["👻", "🎃", "🕷️"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
    // MARK: - Access to the Model
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card : MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

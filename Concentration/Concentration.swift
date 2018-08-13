//
//  Concentration.swift
//  Concentration
//
//  Created by Yves Kurz on 12.08.18.
//  Copyright © 2018 Yves Kurz. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFacUpCard: Int?
    var flipCount = 0
    var score = 0

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacUpCard {
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    score += 2
                } else {
                    score = max(0, score - 1)
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacUpCard = index
            }
            flipCount += 1
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}

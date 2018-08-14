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
    var flipCount = 0
    var score = 0

    var indexOfOneAndOnlyFacUpCard: Int?{
        get {
            var foundIndex: Int? = nil
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacUpCard {
                if (index == matchIndex) {
                    return
                }
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    score += 2
                } else {
                    if (cards[index].wasTurned) {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                cards[index].wasTurned = true

            } else {
                if (cards[index].wasTurned) {
                    score -= 1
                }
                cards[index].wasTurned = true
                
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

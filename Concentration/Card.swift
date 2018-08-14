//
//  Card.swift
//  Concentration
//
//  Created by Yves Kurz on 12.08.18.
//  Copyright © 2018 Yves Kurz. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var wasTurned = false
    var indentifier: Int
    
    static var identifierFactory = 0
    
    static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.indentifier = Card.getIdentifier()
    }
}

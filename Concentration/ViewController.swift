//
//  ViewController.swift
//  Concentration
//
//  Created by Yves Kurz on 12.08.18.
//  Copyright © 2018 Yves Kurz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game:Concentration!
    var theme: Theme!
    let themes: [Theme] = [
        HalloweenTheme(),
        SpaceTheme(),
        SportsTheme()
    ]

    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        newGame()
    }
    override func viewDidLoad() {
        newGame()
    }
    
    func newGame() {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        
        let numberOfThemes = themes.count
        let themeIndex = Int(arc4random_uniform(UInt32(numberOfThemes)))
        
        theme = themes[themeIndex]
        view.backgroundColor = theme.viewBackgrundColor
        cardFaces = theme.cardFaces
        cardEmojiMap.removeAll()
        updateViewFromModel()
    }

    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Error no such card")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiForCard(card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): theme.cardColor
            }
        }
        
        flipsCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
    }
    
    var cardFaces = [String]()
    var cardEmojiMap = [Int:String]()
    func emojiForCard(_ card: Card) -> String {
        if cardEmojiMap[card.indentifier] == nil {
            let emoji = cardFaces.remove(at: Int(arc4random_uniform(UInt32(cardFaces.count))))
            cardEmojiMap[card.indentifier] = emoji
        }
        return cardEmojiMap[card.indentifier] ?? "?"
    }
}


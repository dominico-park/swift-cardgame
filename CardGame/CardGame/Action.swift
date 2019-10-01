//
//  Answer.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

typealias CardAndDeck = (Card, CardDeck)
import Foundation

struct Action {
    
    static func reset(deck: CardDeck) -> CardDeck {
        var tempDeck = deck
        tempDeck.reset()
        return tempDeck
    }
    
    static func shuffle(deck: CardDeck) -> CardDeck {
        var tempDeck = deck
        tempDeck.randomShuffle()
        return tempDeck
    }
    
    static func pickOne(deck: CardDeck) -> CardAndDeck {
        var tempDeck = deck
        let removed = tempDeck.removeOne()
        return CardAndDeck(removed, tempDeck)
    }
}

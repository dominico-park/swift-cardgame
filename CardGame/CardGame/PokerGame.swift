//
//  PokerGame.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PokerGame {
    
    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
    private var dealer: Dealer
    private var players: [Player]
    private let option: GameOption
    
    init(dealer: Dealer & Player, players: [Player], option: GameOption) {
        self.dealer = dealer
        self.players = players + [dealer]
        self.option = option
    }
    
    mutating func run() throws {
        let times = option.numberOfCards
        
        for _ in 0..<times {
            for index in 0..<self.players.count {
                guard let card = dealer.draw() else {
                    throw Error.isCardDeckEmpty
                }
                self.players[index].receive(card: card)
            }
        }
    }
    
    mutating func drawCards() throws -> [Card] {
        var cards = [Card]()
        for _ in 0..<option.numberOfCards {
            guard let card = dealer.draw() else {
                throw Error.isCardDeckEmpty
            }
            cards.append(card)
        }
        return cards
    }
}

extension PokerGame: OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ()) {
        players.forEach { player in
            handler(String(describing: player), player.cards())
        }
    }
}
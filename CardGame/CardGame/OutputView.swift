//
//  OutputView.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView: OutputViewRepresentable {
    
    func printResult(deck: CardDeck, inquiry: Inquiry) -> CardDeck {
        switch inquiry {
        case .reset:
            let changed = Action.reset(deck: deck)
            print("카드 전체를 초기화했습니다.")
            print("총 \(changed.count())장의 카드가 있습니다.")
            return changed
        case .shuffle:
            let changed = Action.shuffle(deck: deck)
            print("전체 \(changed.count())장의 카드를 섞었습니다.")
            return changed
        case .pickOne:
            let cardAndDeck = Action.pickOne(deck: deck)
            let card = cardAndDeck.0
            let deck = cardAndDeck.1
            print(card)
            print("총 \(deck.count())장의 카드가 남아있습니다.")
            return deck
        }
    }
}

protocol OutputViewRepresentable {
    func printResult(deck: CardDeck, inquiry: Inquiry) -> CardDeck
}

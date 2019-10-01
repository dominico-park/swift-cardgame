//
//  GameController.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameController {
    
    var deck: CardDeck
    var outputView: OutputViewRepresentable
    var inputView: InputViewRepresentable
    
    init(cards: [Card], inputView: InputViewRepresentable, outputView: OutputViewRepresentable) {
        self.deck = CardDeck(cards)
        self.inputView = inputView
        self.outputView = outputView
    }
    
    func ask() -> Inquiry? {
        let answerString = inputView.askQuestions()
        do {
            return try Parser.parse(answerString)
        } catch {
            print("error")
            return nil
        }
    }
    
    mutating func answer(inquiry: Inquiry) {
        let remains = outputView.printResult(deck: deck, inquiry: inquiry)
        self.deck = remains
    }
    
    mutating func start(times: Int) {
        for _ in 1...times {
            guard let inquiry = ask() else { return }
            answer(inquiry: inquiry)
        }
    }
}

//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let cards = Card.getAllCards()
let inputView = InputView()
let outputView = OutputView()
var controller = GameController(
    cards: cards,
    inputView: inputView,
    outputView: outputView
)
controller.start(times: 3)



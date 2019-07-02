//
//  Game.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Game {
    var players: [MyPlayer]
    let dealer: MyDealer = MyDealer()
    let setting: Setting
    
    var isContinue: Bool {
        let needs = setting.mode.numOfCard*(self.players.count)
        return self.dealer.canContinue(needs:needs)
    }
    
    init(setting: Setting?) throws {
        guard let setting = setting else {
            throw GameException.initFailure
        }
        self.setting = setting
        self.players = try Game.participate(entry: setting.entry.numOfPlayer)
        self.players.append(dealer)
    }
    
    func start() throws {
        playerReset()
        try drawAll()
        self.players.forEach { OutputView.output(printable: $0) }
       
    }
    
    private static func participate(entry: Int) throws -> [MyPlayer] {
        var players:[MyPlayer] = []
        var index = 0
        try loop(times: entry) {
            players.append(MyPlayer(name: "참가자#\(++index)"))
        }
        return players
    }
    
    private func drawAll() throws {
        try loop(times: setting.mode.numOfCard) {
            sleep(1)
            try drawOne()
            self.players.forEach { OutputView.output(printable: $0) }
        }
    }
    
    private func drawOne() throws {
        for player in players {
            let card = try dealer.draw()
            player.receive(card)
        }
    }
    
    private func playerReset() {
        self.players.forEach{
            $0.clearHand()
        }
    }
    
}
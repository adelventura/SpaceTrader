//
//  Game.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Game {
    let player: Player
    let universe: [Star]
    let difficulty: Difficulty
    
    init(player: Player, universe: [Star], difficulty: Difficulty) {
        self.player = player
        self.universe = universe
        self.difficulty = difficulty
    }
}

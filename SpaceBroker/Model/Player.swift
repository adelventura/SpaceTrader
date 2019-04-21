//
//  Broker.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/14/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Location: Codable {
    var star: Star
    var planet: Planet
    
    init(star: Star, planet: Planet) {
        self.star = star
        self.planet = planet
    }
}

class Player: Codable {
    
    let name: String
    
    let pilotSlider: Int
    let fighterSlider: Int
    let traderSlider: Int
    let engineerSlider: Int
    
    var ship: Ship
    var location: Location!
    
    init(name: String,
         pilotSlider: Int,
         fighterSlider: Int,
         traderSlider: Int,
         engineerSlider: Int,
         ship: Ship
        ) {
        self.name = name
        
        self.pilotSlider = pilotSlider
        self.fighterSlider = fighterSlider
        self.traderSlider = traderSlider
        self.engineerSlider = engineerSlider
        
        self.ship = ship
        
        self.location = nil
    }
    
}

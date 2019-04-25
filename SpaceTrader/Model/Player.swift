//
//  Broker.swift
//  SpaceTrader
//
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
    var credits: Int
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
        
        self.credits = 1000
        self.ship = ship
        self.location = nil
    }
    
}

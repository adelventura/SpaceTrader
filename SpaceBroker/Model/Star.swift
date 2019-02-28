//
//  Star.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Star {
    let name: String
    let starType: StarType
    let xCoordinate: Int
    let yCoordinate: Int
    var planets: [Planet]
    
    init (name: String, starType: StarType, xCoordinate: Int, yCoordinate: Int, planets: [Planet] = []) {
        self.name = name
        self.starType = starType
        self.xCoordinate = xCoordinate
        self.yCoordinate = yCoordinate
        self.planets = planets
    }
}

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
    let coordinates: (Int, Int)
    var planets: [Planet]
    
    init(name: String, starType: StarType, coordinates: (Int, Int), planets: [Planet]) {
        self.name = name
        self.starType = starType
        self.coordinates = coordinates
        self.planets = planets
    }
}

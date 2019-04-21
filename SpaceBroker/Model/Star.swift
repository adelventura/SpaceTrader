//
//  Star.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

class Star: Codable {
    let name: String
    let starType: StarType
    let coordinates: CGPoint
    var planets: [Planet]
    
    init(name: String, starType: StarType, coordinates: CGPoint, planets: [Planet]) {
        self.name = name
        self.starType = starType
        self.coordinates = coordinates
        self.planets = planets
    }
}

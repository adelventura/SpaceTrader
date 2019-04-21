//
//  Planet.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class TradeStock: Codable {
    let amount: Int
    let price: Int
}

class Planet: Codable {
    let name: String
    let techLevel: TechLevel
    let politicalSystem: PoliticalSystem
    let resource: ResourceModifier
    
    var inventory: [TradeGood: TradeStock]
    
    init(name: String, techLevel: TechLevel, politicalSystem: PoliticalSystem, resource: ResourceModifier) {
        self.name = name
        self.techLevel = techLevel
        self.politicalSystem = politicalSystem
        self.resource = resource
        
        self.inventory = [:]
    }
}

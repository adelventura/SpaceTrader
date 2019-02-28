//
//  Planet.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Planet {
    let name: String
    let techLevel: TechLevel
    let politicalSystem: PoliticalSystem
    let resource: Resource
    let star: Star
    let visited: Bool
    
    init(name: String, techLevel: TechLevel, politicalSystem: PoliticalSystem, resource: Resource, star: Star, visited: Bool = false) {
        self.name = name
        self.techLevel = techLevel
        self.politicalSystem = politicalSystem
        self.resource = resource
        self.star = star
        self.visited = visited
    }
}

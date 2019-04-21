//
//  Ship.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Ship: Codable {

    let type: ShipType
    var fuel: Int
    
    var inventory: [TradeGood: Int]
    
    init(type: ShipType) {
        self.type = type
        self.fuel = type.fuelCapacity
        
        self.inventory = [:]
    }
    
    var cargoWeight: Int {
        return inventory.values.reduce(0) { (sum, value) in
            return sum + value
        }
    }
    
    func store(_ good: TradeGood) -> Bool {
        guard cargoWeight + 1 < type.cargoCapacity else {
            return false
        }

        inventory[good] = (inventory[good] ?? 0) + 1
        
        return true
    }
    
    func unstore(_ good: TradeGood) -> Bool {
        let current = inventory[good] ?? 0
        guard current > 0 else {
            return false
        }
        
        inventory[good] = current - 1
        return true
    }
    
}

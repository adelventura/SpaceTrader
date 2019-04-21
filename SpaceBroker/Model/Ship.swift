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
    
    init(type: ShipType) {
        self.type = type
    }
}

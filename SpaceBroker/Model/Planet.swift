//
//  Planet.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

class Planet: Codable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

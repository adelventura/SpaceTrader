//
//  Resource.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

enum ResourceModifier: String, CaseIterable, Codable {
    case NoSpecialResources
    case MineralRich
    case MineralPoor
    case Desert
    case LotsOfWater
    case RichSoil
    case PoorSoil
    case RichFauna
    case Lifeless
    case WeirdMushrooms
    case LotsOfHerbs
    case Artistic
    case Warlike
}

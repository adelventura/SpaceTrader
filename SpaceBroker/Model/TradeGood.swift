//
//  TradeGood.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

enum TradeGood: String, CaseIterable, Codable {
    case water
    case furs
    case food
    case ore
    case games
    case firearms
    case medicine
    case machines
    case narcotics
    case robots
    
    var mtlp: TechLevel {
        switch self {
        case .water: return .Preagricultural
        case .furs: return .Preagricultural
        case .food: return .Agricultural
        case .ore: return .Medieval
        case .games: return .Renaissance
        case .firearms: return .Renaissance
        case .medicine: return .EarlyIndustrial
        case .machines: return .EarlyIndustrial
        case .narcotics: return .PostIndustrial
        case .robots: return .HiTech
        }
    }
    
    var basePrice: Int {
        switch self {
        case .water: return 30
        case .furs: return 250
        case .food: return 100
        case .ore: return 350
        case .games: return 250
        case .firearms: return 1250
        case .medicine: return 650
        case .machines: return 900
        case .narcotics: return 3500
        case .robots: return 500
        }
    }
    
    var ipl: Int {
        switch self {
        case .water: return 3
        case .furs: return 10
        case .food: return 5
        case .ore: return 20
        case .games: return -10
        case .firearms: return -70
        case .medicine: return -20
        case .machines: return -30
        case .narcotics: return -125
        case .robots: return -150
        }
    }
    
    var variance: Int {
        switch self {
        case .water: return 4
        case .furs: return 10
        case .food: return 5
        case .ore: return 10
        case .games: return 5
        case .firearms: return 100
        case .medicine: return 10
        case .machines: return 5
        case .narcotics: return 150
        case .robots: return 100
        }
    }
    
    var ie: RadicalEvent {
        switch self {
        case .water: return .Drought
        case .furs: return .Cold
        case .food: return .CropFail
        case .ore: return .War
        case .games: return .Boredom
        case .firearms: return .War
        case .medicine: return .Plague
        case .machines: return .LackOfWorkers
        case .narcotics: return .Boredom
        case .robots: return .LackOfWorkers
        }
    }
    
    var cr: ResourceModifier? {
        switch self {
        case .water: return .LotsOfWater
        case .furs: return .RichFauna
        case .food: return .RichSoil
        case .ore: return .MineralRich
        case .games: return .Artistic
        case .firearms: return .Warlike
        case .medicine: return .LotsOfHerbs
        case .machines: return nil
        case .narcotics: return .WeirdMushrooms
        case .robots: return nil
        }
    }
    
    var er: ResourceModifier? {
        switch self {
        case .water: return .Desert
        case .furs: return .Lifeless
        case .food: return .PoorSoil
        case .ore: return .PoorSoil
        case .games: return nil
        case .firearms: return nil
        case .medicine: return nil
        case .machines: return nil
        case .narcotics: return nil
        case .robots: return nil
        }
    }
}

//
//  TechLevel.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/26/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

enum TechLevel: Int, CaseIterable, Codable {
    case Preagricultural
    case Agricultural
    case Medieval
    case Renaissance
    case EarlyIndustrial
    case PostIndustrial
    case HiTech
    
    var goods: [TradeGood] {
        return TradeGood
            .allCases
            .filter { rawValue <= $0.mtlp.rawValue }
    }
}

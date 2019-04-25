//
//  TechLevel.swift
//  SpaceTrader
//
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
            .filter { $0.mtlp.rawValue <= rawValue }
    }
}

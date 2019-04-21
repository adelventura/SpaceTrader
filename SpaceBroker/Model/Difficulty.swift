//
//  Difficulty.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/17/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

enum Difficulty: String, Codable, CaseIterable {
    case beginner
    case easy
    case normal
    case hard
    case impossible
    
    var numberOfStars: Int {
        switch self {
        case .beginner: return 50
        case .easy: return 75
        case .normal: return 100
        case .hard: return 200
        case .impossible: return 1000
        }
    }
}

//
//  RadicalEvent.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import Foundation

enum RadicalEvent: Int, CaseIterable, Codable {
    case None
    case Boredom
    case Cold
    case CropFail
    case Drought
    case LackOfWorkers
    case Plague
    case War
}

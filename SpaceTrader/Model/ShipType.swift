//
//  Ship.swift
//  SpaceTrader
//
//

import Foundation

enum ShipType: String, CaseIterable, Codable {
    case Flea
    case Gnat
    case Firefly
    case Mosquito
    case Bumblebee
    case Beetle
    case Hornet
    case Grasshopper
    case Termite
    case Wasp
    
    var fuelCapacity: Int {
        switch self {
        case .Flea: return 20
        case .Gnat: return 14
        case .Firefly: return 14
        case .Mosquito: return 13
        case .Bumblebee: return 15
        case .Beetle: return 14
        case .Hornet: return 16
        case .Grasshopper: return 15
        case .Termite: return 13
        case .Wasp: return 14
        }
    }
    
    var cargoCapacity: Int {
        switch self {
        case .Flea: return 5
        case .Gnat: return 15
        case .Firefly: return 20
        case .Mosquito: return 15
        case .Bumblebee: return 20
        case .Beetle: return 50
        case .Hornet: return 20
        case .Grasshopper: return 30
        case .Termite: return 60
        case .Wasp: return 35
        }
    }
    
    var lyPerTonne: Int {
        return 50
    }
}

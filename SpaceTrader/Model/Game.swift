//
//  Game.swift
//  SpaceTrader
//
//

import Foundation

private enum Keys {
    static let SaveGame = "SaveGame"
}

class Game: Codable {
    let player: Player    
    let universe: [Star]
    let difficulty: Difficulty
    
    init(player: Player, universe: [Star], difficulty: Difficulty) {
        self.player = player
        self.universe = universe
        self.difficulty = difficulty
    }
    
    // MARK: Loading
    
    static func load(_ defaults: UserDefaults = .standard) -> Game? {
        guard let data = defaults.data(forKey: Keys.SaveGame) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        return try? decoder.decode(Game.self, from: data)
    }
    
    func save(_ defaults: UserDefaults = .standard) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            defaults.set(encoded, forKey: Keys.SaveGame)
        }
    }
}

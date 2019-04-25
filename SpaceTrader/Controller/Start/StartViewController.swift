//
//  StartViewController.swift
//  SpaceTrader
//
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var loadGameButton: UIButton!

    // MARK: - Actions
    
    @IBAction func newGameTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CreatePlayer") as? CreatePlayerViewController else {
            return
        }
        
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func loadGameTapped(_ sender: Any) {
        guard let saveGame = Game.load() else {
            let alert = UIAlertController(title: "No save game! Create a player.", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        start(saveGame)
    }
    
    // MARK: - Navigation
    
    private func start(_ game: Game) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Star") as? StarViewController else {
            return
        }
        
        vc.game = game
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
}

extension StartViewController: CreatePlayerDelegate {
    func createPlayerController(_ cpvc: CreatePlayerViewController, didCreatePlayer player: Player, withDifficulty difficulty: Difficulty) {
        cpvc.dismiss(animated: true)
        
        var stars = (0..<difficulty.numberOfStars)
            .map { _ in Star.random() }
        
        let initialPlanet = Planet(
            name: "Paradise-1",
            techLevel: .PostIndustrial,
            politicalSystem: .Democracy,
            resource: .NoSpecialResources
        )
        let initialStar = Star(
            name: "Paradise",
            starType: .Binary,
            coordinates: CGPoint(x: 250, y: 250),
            planets: [initialPlanet]
        )
        
        stars.append(initialStar)
        
        player.location = Location(star: initialStar, planet: initialPlanet)
        
        let game = Game(player: player, universe: stars, difficulty: difficulty)
        game.save()
        
        start(game)
    }
}

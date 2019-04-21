//
//  StartViewController.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
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
        
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
}

extension StartViewController: CreatePlayerDelegate {
    func createPlayerController(_ cpvc: CreatePlayerViewController, didCreatePlayer player: Player, withDifficulty difficulty: Difficulty) {
        cpvc.dismiss(animated: true)
        
        let game = Game(player: player, universe: [], difficulty: difficulty)
        game.save()
        
        start(game)
    }
}

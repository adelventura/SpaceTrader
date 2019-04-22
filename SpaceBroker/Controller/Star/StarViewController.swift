//
//  StarViewController.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Star: \(game.player.location.star.name)"
        
        buttons.forEach { button in
            button.layer.cornerRadius = 15
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.layer.borderWidth = 2
        }
    }
    
    // MARK: - Actions
    
    @IBAction func shipInformationTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ship") as? ShipViewController else {
            return
        }
        
        vc.game = game
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func marketplaceTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MarketPlace") as? MarketPlaceViewController else {
            return
        }
        
        vc.game = game
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func mapTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Map") as? MapViewController else {
            return
        }
        
        vc.game = game
        navigationController?.pushViewController(vc, animated: true)
    }
}

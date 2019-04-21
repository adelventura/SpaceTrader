//
//  MarketPlaceViewController.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

class MarketPlaceViewController: UIViewController {
    
    // MARK: - Properties
    
    var game: Game!
    
    // MARK: Outlets
    
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    
    @IBOutlet weak var planetCollection: UICollectionView!
    @IBOutlet weak var shipCollection: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(game.player.location.star.name)'s MarketPlace"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        update()
    }
    
    // MARK: - Utilities
    
    private func update() {
        creditsLabel.text = "Credits: \(game.player.credits)"
        
        let ship = game.player.ship
        capacityLabel.text = "Remaining Capacity: \(ship.type.cargoCapacity - ship.cargoWeight)"
    }
}

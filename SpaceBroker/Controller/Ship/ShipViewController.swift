//
//  ShipViewController.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 4/21/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

class ShipViewController: UIViewController {
    
    // MARK: - Properties
    
    var game: Game!
    
    // MARK: Outlets
    
    @IBOutlet weak var currentCreditsLabel: UILabel!
    
    @IBOutlet weak var maxCargoCapacityLabel: UILabel!
    @IBOutlet weak var cargoSpaceRemainingLabel: UILabel!
    
    @IBOutlet weak var maxFuelCapacityLabel: UILabel!
    @IBOutlet weak var fuelRemainingLabel: UILabel!
    
    @IBOutlet weak var buyFuelButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shipType = game.player.ship.type
        navigationItem.title = "Current Status of \(shipType)"
    }
    
    // MARK: - Actions
    
    @IBAction func buyFuelTapped(_ sender: Any) {
        let player = game.player
        let ship = player.ship
        
        
        guard ship.refuel() && player.credits >= 5 else {
            let alert = UIAlertController(title: "Fuel tanks at maximum capacity or Not enough credits", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        player.credits -= 5
        update()
        
        game.save()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        update()
    }
    
    // MARK: - Utilities
    
    private func update() {
        
        let ship = game.player.ship
        let shipType = ship.type
        let player = game.player
        
        currentCreditsLabel.text = "Current Credits: \(player.credits)"
        
        maxCargoCapacityLabel.text = "Max Cargo Capacity: \(shipType.cargoCapacity)"
        cargoSpaceRemainingLabel.text = "Cargo Space Remaining: \(shipType.cargoCapacity - ship.cargoWeight)"
        
        maxFuelCapacityLabel.text = "Max Fuel Tank Capacity: \(shipType.fuelCapacity)"
        fuelRemainingLabel.text = "Fuel Remaining: \(ship.fuel)"
        
        
    }

    
}

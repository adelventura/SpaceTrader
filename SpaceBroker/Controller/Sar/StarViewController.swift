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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Star: \(game.player.location.star.name)"
    }
    
}

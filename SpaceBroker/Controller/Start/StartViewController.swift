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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CreatePlayer") else {
            return
        }
        
        present(vc, animated: true)
    }
    
    @IBAction func loadGameTapped(_ sender: Any) {
        
    }
    
}

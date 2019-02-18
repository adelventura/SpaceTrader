//
//  ViewController.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/14/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var createButton: UIButton!
    
    @IBOutlet var difficultyButtonContainer: UIView!
    @IBOutlet var difficultyButtons: [UIButton]!
    
    private let vm = ConfigurePlayerViewModel()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        createButton.layer.cornerRadius = 10
        
        createButton.layer.shadowRadius = 2
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        createButton.layer.shadowOpacity = 1
        
        difficultyButtonContainer.layer.cornerRadius = 10
        difficultyButtonContainer.layer.borderWidth = 0.5
        difficultyButtonContainer.layer.borderColor = UIColor.white.cgColor
        
        difficultyButtons.forEach { button in
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.white.cgColor
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func selectedDifficulty(sender: UIButton) {
        guard let index = difficultyButtons.firstIndex(of: sender) else {
            return
        }
        
        vm.difficulty = Difficulty.allCases[index]
        difficultyButtons.forEach { button in
            button.backgroundColor = .clear
        }
        sender.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.8, alpha: 1.0)
    }
    
    @IBAction func create() {
        let alert: UIAlertController
        if let name = nameField.text, let difficulty = vm.difficulty, name.count > 0 {
            alert = UIAlertController(title: "Created!", message: "Broker by the name of \(name). Difficulty: \(difficulty)", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "Name missing or difficulty not selected!", message: nil, preferredStyle: .alert)
        }
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        present(alert, animated: true)
        
    }
    
//    @IBAction func removeKeyboard() {
//        self.nameField.resignFirstResponder()
//    }
    

    // MARK: - Effects
    
    @IBAction func down() {
        createButton.layer.shadowOpacity = 0
        createButton.transform = .init(translationX: 5, y: 5)
    }
    
    @IBAction func up() {
        createButton.layer.shadowOpacity = 1
        createButton.transform = .identity
    }
    
}


//
//  ViewController.swift
//  SpaceTrader
//
//  Created by Ashley DelVentura on 2/14/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit

private enum Constants {
    static let TotalPoints: Int = 16
}

protocol CreatePlayerDelegate: class {
    func createPlayerController(_ cpvc: CreatePlayerViewController, didCreatePlayer player: Player, withDifficulty difficulty: Difficulty)
}

class CreatePlayerViewController: UIViewController {

    // MARK: - Properties
    
    weak var delegate: CreatePlayerDelegate?
    
    // MARK: Outlets
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var createButton: UIButton!
    
    @IBOutlet var pilotSlider: UISlider!
    @IBOutlet var fighterSlider: UISlider!
    @IBOutlet var traderSlider: UISlider!
    @IBOutlet var engineerSlider: UISlider!
    
    @IBOutlet var totalPointsUsed: UILabel!
    @IBOutlet var pilotPoints: UILabel!
    @IBOutlet var fighterPoints: UILabel!
    @IBOutlet var traderPoints: UILabel!
    @IBOutlet var engineerPoints: UILabel!
    
    @IBOutlet var difficultyButtonContainer: UIView!
    @IBOutlet var difficultyButtons: [UIButton]!
    
    // MARK: State
    
    private var difficulty: Difficulty = .beginner
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
        
        selectedDifficulty(sender: difficultyButtons.first!)
        
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    
    @IBAction func changePilotPoints(_ sender: UISlider) {
        pilotSlider.value = roundf(pilotSlider.value)
        updateSkillPoints(slider: pilotSlider, label: pilotPoints)
        updateTotalSkillPoints(sender)
        
    }
    
    @IBAction func changeFighterPoints(_ sender: UISlider) {
        fighterSlider.value = roundf(fighterSlider.value)
        updateSkillPoints(slider: fighterSlider, label: fighterPoints)
        updateTotalSkillPoints(sender)
    }
    
    @IBAction func changeTraderPoints(_ sender: UISlider) {
        traderSlider.value = roundf(traderSlider.value)
        updateSkillPoints(slider: traderSlider, label: traderPoints)
        updateTotalSkillPoints(sender)
    }
    
    @IBAction func changeEngineerPoints(_ sender: UISlider) {
        engineerSlider.value = roundf(engineerSlider.value)
        updateSkillPoints(slider: engineerSlider, label: engineerPoints)
        updateTotalSkillPoints(sender)
    }
    
    @IBAction func selectedDifficulty(sender: UIButton) {
        guard let index = difficultyButtons.firstIndex(of: sender) else {
            return
        }
        
        difficulty = Difficulty.allCases[index]
        difficultyButtons.forEach { button in
            button.backgroundColor = .clear
        }
        
        sender.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.8, alpha: 1.0)
    }
    
    @IBAction func create() {
        guard let name = nameField.text, name.count > 0 else {
            let alert = UIAlertController(title: "Name missing!", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }

        let player = Player(
            name: name,
            pilotSlider: Int(pilotSlider!.value),
            fighterSlider: Int(fighterSlider!.value),
            traderSlider: Int(traderSlider!.value),
            engineerSlider: Int(engineerSlider!.value),
            ship: Ship(type: .Gnat)
        )
        delegate?.createPlayerController(self, didCreatePlayer: player, withDifficulty: difficulty)
    }

    // MARK: - Effects
    
    @IBAction func down() {
        createButton.layer.shadowOpacity = 0
        createButton.transform = .init(translationX: 5, y: 5)
    }
    
    @IBAction func up() {
        createButton.layer.shadowOpacity = 1
        createButton.transform = .identity
    }
    
    func updateTotalSkillPoints(_ sender: UISlider) {
        let sliders: [UISlider] = [pilotSlider, fighterSlider, traderSlider, engineerSlider]
        
        var total: Int {
            return sliders.reduce(0) { (sum, slider) in
                return sum + Int(slider.value)
            }
        }

        var delta = min(0, Constants.TotalPoints - total)
        while (delta < 0) {
            sliders
                .filter { $0 != sender && $0.value > 0 }
                .forEach {
                    delta += 1
                    $0.value -= 1
            }
        }
        
        totalPointsUsed.text = "Total Skill Points: \(total)/\(Constants.TotalPoints)"
    }
    
    func updateSkillPoints(slider: UISlider, label: UILabel) {
        label.text = "\(Int(slider.value))"
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


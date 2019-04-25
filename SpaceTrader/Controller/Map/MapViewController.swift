//
//  MapViewController.swift
//  SpaceTrader
//
//

import UIKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    var game: Game!
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
    }
    
    // MARK: - Actions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTitle()
    }
    
    // MARK: - Util
    
    private func starsTravelable() -> [Star] {
        let current = game.player.location.star
        let ship = game.player.ship
        return game.universe.filter { $0.distance(to: current) < (ship.fuel * ship.type.lyPerTonne) }
    }
    
    private func updateTitle() {
        let player = game.player
        let location = player.location!
        let planet = location.planet
        let star = location.star
        
        navigationItem.title = "Current Location: \(planet.name) in \(star.name) system at \(star.coordinates)"
    }
    
}

extension MapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return starsTravelable().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let stars = starsTravelable()
        let star = stars[indexPath.item]
        let current = game.player.location.star
        let distance = current.distance(to: star)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCollectionViewCell
        cell.titleLabel.text = "\(star.name) (\(star.coordinates.x), \(star.coordinates.y)) [\(distance) ly Away]"
        
        return cell
    }
    
}

extension MapViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let star = starsTravelable()[indexPath.item]
        let current = game.player.location.star
        let distance = current.distance(to: star)
        let ship = game.player.ship
        let cost = max(1, distance / ship.type.lyPerTonne)
        
        let alert = UIAlertController(title: "Travel \(distance) lightyears using \(cost) tonnes of fuel?", message: nil, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Warp!", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            ship.fuel -= cost
            
            let location = Location(star: star, planet: star.planets.first!)
            self.game.player.location = location
            self.game.save()
            
            self.updateTitle()
            self.collectionView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true)
        }
        
        alert.addAction(confirm)
        alert.addAction(cancel)

        present(alert, animated: true)
    }
}

extension MapViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 50)
    }
}

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
        
        planetCollection.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
        shipCollection.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
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
        
        planetCollection.reloadData()
        shipCollection.reloadData()
    }
}


extension MarketPlaceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case planetCollection:
            let planet = game.player.location.planet
            return planet.inventory.count
        case shipCollection:
            return game.player.ship.inventory.count
        default:
            fatalError("idk")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! TitleCollectionViewCell
        switch collectionView {
        case planetCollection:
            let planet = game.player.location.planet
            let sortedGoods = planet.inventory.keys.sorted(by: { a, b in
                a.rawValue < b.rawValue
            })
            let good = sortedGoods[indexPath.item]
            let stock = planet.inventory[good]!
            
            cell.titleLabel.text = "\(good.rawValue) (\(stock.price)₴) [\(stock.amount)]"
        case shipCollection:
            let ship = game.player.ship
            let sortedGoods = ship.inventory.keys.sorted(by: { a, b in
                a.rawValue < b.rawValue
            })
            let good = sortedGoods[indexPath.item]
            let stock = ship.inventory[good]!
            cell.titleLabel.text = "\(good.rawValue) [\(stock)]"
            
        default:
            fatalError("idk")
        }
        
        return cell
    }
    
}

extension MarketPlaceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let planet = game.player.location.planet
        let player = game.player
        let ship = player.ship

        switch collectionView {
        case planetCollection:
            let sortedGoods = planet.inventory.keys.sorted(by: { a, b in
                a.rawValue < b.rawValue
            })
            let good = sortedGoods[indexPath.item]
            let stock = planet.inventory[good]!
            
            if stock.amount <= 0 {
                let alert = UIAlertController(title: "Planet out of stock!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }
            
            if player.credits < stock.price {
                let alert = UIAlertController(title: "Not enough credits!", message: nil, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }
            
            if ship.cargoWeight >= ship.type.cargoCapacity {
                let alert = UIAlertController(title: "Not enough room on ship!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }
            
            let alert = UIAlertController(title: "Buy 1 \(good.rawValue) for \(stock.price)₴?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                alert.dismiss(animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Buy!", style: .default, handler: { [weak self] _ in
                guard let self = self else { return }
                
                player.credits -= stock.price
                planet.inventory[good] = TradeStock(
                    amount: stock.amount - 1,
                    price: stock.price
                )
                _ = ship.store(good)
                
                self.game.save()
                self.update()
            }))
            present(alert, animated: true)
        case shipCollection:
            let sortedGoods = ship.inventory.keys.sorted(by: { a, b in
                a.rawValue < b.rawValue
            })
            let good = sortedGoods[indexPath.item]
            let stock = ship.inventory[good]!
            
            if stock <= 0 {
                let alert = UIAlertController(title: "None to sell!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }
            
            guard let planetStock = planet.inventory[good] else {
                let alert = UIAlertController(title: "This planet can't buy that!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                present(alert, animated: true)
                return
            }

            let alert = UIAlertController(title: "Sell 1 \(good.rawValue) for \(planetStock.price)₴?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                alert.dismiss(animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Sell!", style: .default, handler: { [weak self] _ in
                guard let self = self else { return }
                
                player.credits += planetStock.price
                planet.inventory[good] = TradeStock(
                    amount: planetStock.amount + 1,
                    price: planetStock.price
                )
                _ = ship.unstore(good)
                
                self.game.save()
                self.update()
            }))
            present(alert, animated: true)
        default:
            fatalError("idk")
        }
    }
}

extension MarketPlaceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width / 2, height: 50)
    }
}

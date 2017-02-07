//
//  PokeDetailVC.swift
//  PokeDex
//
//  Created by Prasanth Ramineni on 2/6/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIDLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var nextEvoLabel: UILabel!
    
    
    @IBOutlet weak var loadingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideUI(bool: true)

        pokemon.downloadPokeDetails() { success in
            if success {
                self.updateUI()
            } else {
                print("Error")
            }
        }
    }
    
    func hideUI(bool: Bool) {
        for view in self.view.subviews {
            view.isHidden = bool
        }
        loadingLabel.isHidden = !bool
    }
    
    func updateUI() {
        nameLabel.text = pokemon.name.capitalized
        
        let image = UIImage(named: "\(pokemon.pokedexID)")
        mainImage.image = image
        currentEvoImage.image = image
        pokedexIDLabel.text = "\(pokemon.pokedexID)"
        
        attackLabel.text = pokemon.attack
        defenceLabel.text = pokemon.defence
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descLabel.text = pokemon.description
        
        print("Defence:: \(defenceLabel.text)")
        
        
        if pokemon.nextEvolutionID == "" {
            nextEvoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            nextEvoLabel.text = str
        }
        
        hideUI(bool: false)
    }
    
    @IBAction func backBtnPresses(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

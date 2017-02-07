//
//  MainVC.swift
//  PokeDex
//
//  Created by Prasanth Ramineni on 2/5/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemons = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    
    var musicPlayer: AVAudioPlayer!
    var insearchMode: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
        
        initAudio()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as? PokeCell {
            
            let pokemon: Pokemon!
            
            if insearchMode {
                pokemon = filteredPokemon[indexPath.row]
            } else {
                pokemon = pokemons[indexPath.row]
            }
            
            cell.configureCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var poke: Pokemon!
        
        if insearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemons[indexPath.row]
        }
        
        performSegue(withIdentifier: "pokeDetailSegue", sender: poke)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pokeDetailSegue" {
            
            if let destinationVC = segue.destination as? PokeDetailVC {
                
                if let poke = sender as? Pokemon {
                    destinationVC.pokemon = poke
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if insearchMode {
            return filteredPokemon.count
        }
        return pokemons.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            insearchMode = false
            collection.reloadData()
            
            view.endEditing(true)
            
            
        } else {
            insearchMode = true
            let lower = searchBar.text!.lowercased()
            
            filteredPokemon = pokemons.filter({ $0.name.range(of: lower) != nil})
            collection.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func parsePokemonCSV() {
        let filePath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSVParser(contentsOfURL: filePath)
            let rows = csv.rows
            
            for row in rows {
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                
                pokemons.append(Pokemon(name: name, pokedexID: pokeID))
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
}


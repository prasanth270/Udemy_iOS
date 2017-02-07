//
//  Pokemon.swift
//  PokeDex
//
//  Created by Prasanth Ramineni on 2/5/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionID: String!
    private var _nextEvolutionLevel: String!
    private var _pokeURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defence: String {
        if _defence == nil {
            _defence = ""
        }
        return _defence
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionTxt: String {
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }
    
    var nextEvolutionID: String {
        if _nextEvolutionID == nil {
            _nextEvolutionID = ""
        }
        return _nextEvolutionID
    }
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        self._pokeURL = "\(BASE_URL)\(POKEMON_URL)\(self.pokedexID)/"
    }
    
    func downloadPokeDetails(completed: @escaping (Bool) -> ()) {
        
        Alamofire.request(self._pokeURL).responseJSON { (response) in

            if let resultDict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let attack = resultDict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let weight = resultDict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = resultDict["height"] as? String {
                    self._height = height
                }
                
                if let defence = resultDict["defense"] as? Int {
                    self._defence = "\(defence)"
                }
                
                if let types = resultDict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name)"
                            }
                        }
                    }
                    
                } else {
                    self._type = ""
                }
                
                if let descriptions = resultDict["descriptions"] as? [Dictionary<String, String>], descriptions.count > 0 {
                    
                    if let url = descriptions[0]["resource_uri"] {
                        
                        let URL = "\(BASE_URL)\(url)"
                        
                        Alamofire.request(URL).responseJSON{ (response) in
                            if let descriptionDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descriptionDict["description"] as? String {
                                    let newDesc = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    print(newDesc)
                                    self._description = newDesc
                                }
                            }
                            completed(true)
                        }
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions = resultDict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                    
                    if let nextEvolutionName = evolutions[0]["to"] as? String {
                        
                        if nextEvolutionName.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvolutionName
                        } else {
                            self._nextEvolutionName = ""
                        }
                    }
                    
                    if let nextEvolutionId = evolutions[0]["resource_uri"] as? String {
                        let newStr = nextEvolutionId.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                        let evolutionID = newStr.replacingOccurrences(of: "/", with: "")
                        self._nextEvolutionID = evolutionID
                    }
                    
                    if let levelExist = evolutions[0]["level"] {
                        if let level = levelExist as? Int {
                            self._nextEvolutionLevel = "\(level)"
                        }
                    } else {
                        self._nextEvolutionLevel = ""
                    }
                }
            }
            print("Completed")
            completed(true)
        }
        
    }
    
}

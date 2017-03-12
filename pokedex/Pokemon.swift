//
//  Pokemon.swift
//  pokedex
//
//  Created by 小林 泰 on 2017/03/12.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
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
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weigtht: String {
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
    
    var nextEvolutionText: String {
        
        if _nextEvolutionTxt == nil {
            
            _nextEvolutionTxt = ""
            
        }
        return _nextEvolutionTxt
        
    }
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
//                if let attack = dict["attack"] as? Int {
//                    self._attack = "\(attack)"
//                }
//                if let defence = dict["defence"] as? Int {
//                    self._defense = "\(defence)"
//                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = "\(defense)"
                    }
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._attack = "\(attack)"
                    }
                }
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
                    
                    
                    if let type = types[0]["type"] as? Dictionary<String, AnyObject> {
                        if let name = type["name"] as? String{
                            self._type = name.capitalized
                        }
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let type = types[x]["type"] as? Dictionary<String, AnyObject> {
                                if let name = type["name"] as? String{
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                    }
                    
//                    if let name = types[0]["type"] {
//                        self._type = name.capitalized
//                    }
                    
//                    if types.count > 1 {
//                        
//                        for x in 1..<types.count {
//                            if let name = types[x]["name"] {
//                                self._type! += "\(name.capitalized)"
//                            }
//                        }
//                    }
                    
                    print(self._type)
                    
                } else {
                    self._type = ""
                }
            }
            
            completed()
        
        
        }
    }
    
}

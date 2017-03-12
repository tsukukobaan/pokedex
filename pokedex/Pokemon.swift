//
//  Pokemon.swift
//  pokedex
//
//  Created by 小林 泰 on 2017/03/12.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
}

//
//  PokeCell.swift
//  pokedex
//
//  Created by 小林 泰 on 2017/03/12.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumgImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumgImg.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
}

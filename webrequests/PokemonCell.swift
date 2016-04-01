//
//  PokemonCell.swift
//  webrequests
//
//  Created by Joseph Garcia on 4/1/16.
//  Copyright © 2016 joebeard. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        pokemonName.text = self.pokemon.name.capitalizedString
        pokemonImg.image = UIImage(named: "\(self.pokemon.pokemonId)")
    }
}

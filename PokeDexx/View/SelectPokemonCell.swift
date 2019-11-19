//
//  SelectPokemonCell.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class SelectPokemonCell: UICollectionViewCell {

    @IBOutlet weak var imagePokemonCell: UIImageView!
    @IBOutlet weak var pokemonLblCell: UILabel!
    
    
    func configName(pokemon : Pokemon) {
        let namePokemon = pokemon.name
        pokemonLblCell.text = namePokemon
    }
}


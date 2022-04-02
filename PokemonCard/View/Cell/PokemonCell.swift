//
//  PokemonCell.swift
//  PokemonCard
//
//  Created by Selcuk on 1.04.2022.
//

import UIKit

class PokemonCell: UICollectionViewCell {
 

    
    @IBOutlet weak var pokemonTitle: UILabel!
    @IBOutlet weak var hpPokemon: UILabel!
    @IBOutlet weak var hpValue: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var attackPokemon: UILabel!
    @IBOutlet weak var attackValue: UILabel!
    @IBOutlet weak var defensePokemon: UILabel!
    @IBOutlet weak var defenseValue: UILabel!
    
    
    var datas: PokemonSkills?{
        didSet{
            pokemonTitle.text = datas?.name.capitalized
            hpPokemon.text = datas?.stats[0].stat.name.capitalized
            hpValue.text = datas?.stats[0].baseStat.formatted()
            attackPokemon.text = datas?.stats[1].stat.name.capitalized
            attackValue.text = datas?.stats[1].baseStat.formatted()
            defensePokemon.text = datas?.stats[2].stat.name.capitalized
            defenseValue.text = datas?.stats[2].baseStat.formatted()
            pokemonImage.loadImage(datas?.sprites.front ?? "")
            
        }
    }
    
 
   

}



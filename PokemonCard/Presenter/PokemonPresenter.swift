//
//  PokemonPresenter.swift
//  PokemonCard
//
//  Created by Selcuk on 31.03.2022.
//

import Foundation


protocol PokemonDelegate: AnyObject{
    func pokemonUpdate()
}

final class PokemonPresenter{
    weak var delegate: PokemonDelegate?
    var pokemonList: [PokemonSkills] = []
     
    
    func pokemonSkills(){
        Network.shared.loadJSON { data in
            self.mapPokemonSkills(pokemon: data)
        }
    }
    
    // append all pokemons skill to the array.
    func mapPokemonSkills(pokemon: Pokemon) {
        pokemonList = []
        let group = DispatchGroup()

        for i in 1...pokemon.results.count {
            group.enter()
            Network.shared.fetchSkill(index: i) { data in
                self.pokemonList.append(data)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.delegate?.pokemonUpdate()
        }
        
    }
}




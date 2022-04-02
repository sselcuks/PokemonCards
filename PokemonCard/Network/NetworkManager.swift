//
//  NetworkManager.swift
//  PokemonCard
//
//  Created by Selcuk on 31.03.2022.
//

import Foundation


struct Network{
    static let shared = Network()
    
    // Fetching initial urls of pokemons.
    func loadJSON(completion: @escaping (Pokemon) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon/"
        guard let urlObj = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
            guard let data = data else { return }
            
            do {
                let pokedex = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(pokedex)
                
            } catch let jsonErr{
                print("Error serializing JSON: ", jsonErr)
            }
        }.resume()
    }
    
    // Fetch all pokemons skill.
    func fetchSkill(index: Int, completion: @escaping (PokemonSkills) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(index)/"
        guard let urlObj = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
            guard let data = data else { return }
            
            do {
                let pokeSkill = try JSONDecoder().decode(PokemonSkills.self, from: data)
                completion(pokeSkill)
                
            } catch let jsonErr{
                print("Error serializing JSON: ", jsonErr)
            }
        }.resume()
    }
}

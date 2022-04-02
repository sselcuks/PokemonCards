//
//  Final.swift
//  PokemonCard
//
//  Created by Selcuk on 1.04.2022.
//

import Foundation
import UIKit

class PokemonVC:UIViewController{
    
    
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var presenter = PokemonPresenter()
 
    var index = 0
    var pokemonDatas: [PokemonSkills]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        getData()
        config()
    }
    
    func getData() {
        presenter.pokemonSkills()
    }
    
    func config(){
        pokemonCollection.layer.cornerRadius = 24
        pokemonCollection.delegate = self
        pokemonCollection.dataSource = self
    }
    
    
    //reset index start from initial pokemon.
    @IBAction func restartBtn(_ sender: Any) {
        
        self.index = 0
        pokemonCollection.reloadData()
    }
    
}

extension PokemonVC: PokemonDelegate{
    func pokemonUpdate() {
       
        pokemonDatas = presenter.pokemonList
        pokemonCollection.reloadData()
    }
    
    
}
extension PokemonVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokemonCell else {return UICollectionViewCell()}
    
        cell.datas = pokemonDatas?[index]
        return cell
    }
   
    // transition animation
    @objc func flip(){
        
        if (index % 2 == 0){
            UIView.transition(with: pokemonCollection, duration: 0.5, options: [.transitionFlipFromTop], animations: nil, completion: nil)
        }
        else{
            UIView.transition(with: pokemonCollection, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: nil)
        }
    
    }

    // On tap show next pokemon character.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        perform(#selector(flip))
        index+=1
        if (index == 20){
            print("end")
            index-=1
           // show error when pokemons list finished.
            displayAlert(title: "Final Pokemon", message: "Press button to return first pokemon.")
        }
       pokemonCollection.reloadData()
   
    }
}

extension PokemonVC:AlertDisplaying{}

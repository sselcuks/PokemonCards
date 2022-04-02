//
//  ImageExtension.swift
//  PokemonCard
//
//  Created by Selcuk on 2.04.2022.
//

import Foundation
import UIKit

extension UIImageView{
    func loadImage(_ url:String){
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                guard let url = URL(string: url) else{return}
                
                guard let data = try? Data(contentsOf: url)else{
                    return
                }
                self.image = UIImage(data:data)
            }
        }
    }
}

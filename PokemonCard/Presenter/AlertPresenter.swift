//
//  AlertPresenter.swift
//  PokemonCard
//
//  Created by Selcuk on 2.04.2022.
//

import Foundation
import UIKit

protocol AlertDisplaying where Self: UIViewController{
    func displayAlert(title: String, message: String)
}
extension AlertDisplaying {
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = (UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        alertController.addAction(buttonAction)
        present(alertController, animated: true, completion: nil)
    }
}

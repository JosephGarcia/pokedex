//
//  pokemonDetailsVC.swift
//  webrequests
//
//  Created by Joseph Garcia on 4/2/16.
//  Copyright © 2016 joebeard. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonCurrentEvo: UIImageView!
    @IBOutlet weak var pokemonNextEvo: UIImageView!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalizedString
        pokemonImg.image = UIImage(named: "\(pokemon.pokemonId)")
        
        pokemon.downloadPokemonDetails { () -> () in
            //this code will load when download is complete
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}

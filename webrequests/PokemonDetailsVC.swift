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
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonCurrentEvo: UIImageView!
    @IBOutlet weak var pokemonNextEvo: UIImageView!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: String(pokemon.pokemonId))
        pokemonImg.image = img
        pokemonCurrentEvo.image = img
        
        
        pokemon.downloadPokemonDetails { () -> () in
            //this code will load when download is complete
            self.updateUI()
        }
    }
    
    func updateUI(){
        pokemonDescription.text = pokemon.description
        pokemonType.text = pokemon.type
        pokemonDefense.text = pokemon.defense
        pokemonHeight.text = pokemon.height
        pokemonWeight.text = pokemon.weight
        pokemonAttack.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            nextEvolutionLbl.text = "This Pokemon does not evolve any further"
            pokemonNextEvo.hidden = true
        } else {
            pokemonNextEvo.hidden = false
            pokemonNextEvo.image = UIImage(named: String(pokemon.nextEvolutionId))
            var str = "Next Evolution: \(pokemon.nextEvolution)"
            
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            nextEvolutionLbl.text = str
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

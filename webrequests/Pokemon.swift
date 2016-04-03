//
//  Pokemon.swift
//  webrequests
//
//  Created by Joseph Garcia on 4/1/16.
//  Copyright © 2016 joebeard. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokemonId: Int!
    private var _description: String!
    private var _height: String!
    private var _type: String!
    private var _weight: String!
    private var _defense:String!
    private var _attack: String!
    private var _nextEvolution: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokemonId: Int {
        return _pokemonId
    }
    
    init(name: String, id: Int) {
        self._name = name
        self._pokemonId = id
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokemonId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = String(attack)
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = String(defense)
                }
                
                print(self._height)
                print(self._weight)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
            }
        }
    }
}
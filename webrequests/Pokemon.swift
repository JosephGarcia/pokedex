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
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokemonId: Int {
        return _pokemonId
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _height
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
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
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name)".capitalizedString
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String,String>] where descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let nsUrl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsUrl).responseJSON(completionHandler: { (response ) -> Void in
                            let result = response.result
                            
                            if let descriptionDict = result.value as? Dictionary<String,AnyObject> {
                                if let description = descriptionDict["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                            completed()
                        })
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0 {
                    if let to = evolutions[0]["to"] as? String {
                        if to.rangeOfString("mega") == nil {
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                
                                let nextEvoId = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = nextEvoId
                                self._nextEvolution = to
                                
                                if let level = evolutions[0]["level"] as? Int {
                                    self._nextEvolutionLevel = String(level)
                                }
                                
                                print("TEXT: \(self._nextEvolution)")
                                print("ID: \(self._nextEvolutionId)")
                                print("LEVEL TO EVOLVE: \(self._nextEvolutionLevel)")
                            }
                        }
                    }
                }
            }
        }
    }
}
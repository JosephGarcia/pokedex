//
//  Pokemon.swift
//  webrequests
//
//  Created by Joseph Garcia on 4/1/16.
//  Copyright © 2016 joebeard. All rights reserved.
//

import Foundation

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
    
    var name: String {
        return _name
    }
    
    var pokemonId: Int {
        return _pokemonId
    }
    
    init(name: String, id: Int) {
        self._name = name
        self._pokemonId = id
    }
}
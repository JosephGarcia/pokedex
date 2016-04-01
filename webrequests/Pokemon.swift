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
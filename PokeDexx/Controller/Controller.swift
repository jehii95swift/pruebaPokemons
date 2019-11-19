//
//  Controller.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
class Controller {
    
    var services = Services()
    
    func getPokemones() -> [Pokemon] {
        let consigioPokemon = services.pokemones
        return consigioPokemon
    }
    func getTypes() -> [String] {
        let conseguirTipos = services.types
        return conseguirTipos
    }
    func getNames() -> String {
        let conseguirNombres = services.sprite
        return conseguirNombres
    }
    func requestPokemones() {
        services.requestPokemones()
    }
    func requestInfo(name: String) {
        services.requestInfo(name: name)
    }
}

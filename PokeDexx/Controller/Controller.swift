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
    
    func getPokemons() -> [Pokemon] {
        return services.pokemons
    }
    
    func requestPokemons() {
        services.requestPokemons()
    }
    
    func requestInfo(name: String, completion: @escaping (Pokemon) -> ()) {
        services.requestInfo(name: name, completion: completion)
    }
}

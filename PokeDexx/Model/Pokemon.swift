//
//  Pokemon.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import ObjectMapper

class Pokemon: Mappable {
    
    var name:String = ""
    var stats: [PokemonStats] = []
    var pokemonInfo: PokemonInfo = PokemonInfo()
    var sprites:[String:String?] = [:]
    
    init(name: String, url: String) {
        self.name = name
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        stats <- map["stats"]
        sprites <- map["sprites"]
        
        
        //estas funciones son ineficientes y podrian ser mejoradas con un metodo mejor para el mapeo de los stats del pokemon, pero por la premura del asunto, las dejo con esta logica
        if let speedStat = (stats.first { $0.statName == "speed" }) {
            pokemonInfo.speed = speedStat.baseStat
        }
        
        if let specialDefStat = (stats.first { $0.statName == "special-defense" }) {
            pokemonInfo.specialDefense = specialDefStat.baseStat
        }
        
        if let specialAttkStat = (stats.first { $0.statName == "special-attack" }) {
            pokemonInfo.specialAttack = specialAttkStat.baseStat
        }
        
        if let defense = (stats.first { $0.statName == "defense" }) {
            pokemonInfo.defense = defense.baseStat
        }
        
        if let attack = (stats.first { $0.statName == "attack" }) {
            pokemonInfo.attack = attack.baseStat
        }
        
        if let hp = (stats.first { $0.statName == "hp" }) {
            pokemonInfo.hp = hp.baseStat
        }
    }
}

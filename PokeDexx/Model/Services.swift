//
//  Services.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Services {
    
    var pokemones: [Pokemon] = []
    var types: [String] = []
    var sprite: String = ""
    
    func requestPokemones() {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon").responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)")
                
                
                if let pokemones = json["results"] as? [[String: String]] {
                    for pokemonDict in pokemones {
                        let name = pokemonDict["name"] ?? ""
                        let url = pokemonDict["url"] ?? ""
                        let pokemon = Pokemon(name:name, url:url)
                        self.pokemones.append(pokemon)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tengolospokemones"), object: nil)
                }
                print("ko")
                
            }
        }
    }
    func requestInfo(name: String) {
        
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(name)").responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)")
                
                let pokemon = ObjectMapper.Mapper<Pokemon>().map(JSON: json)
                
                print("XELQLO")
                
            }
        }
    }
}

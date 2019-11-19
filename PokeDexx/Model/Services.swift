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
    
    var pokemons: [Pokemon] = []
    
    func requestPokemons() {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon").responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)")
                
                
                if let pokemones = json["results"] as? [[String: String]] {
                    for pokemonDict in pokemones {
                        let name = pokemonDict["name"] ?? ""
                        let url = pokemonDict["url"] ?? ""
                        let pokemon = Pokemon(name:name, url:url)
                        self.pokemons.append(pokemon)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tengolospokemones"), object: nil)
                }
            }
        }
    }
    
    func requestInfo(name: String, completion: @escaping (Pokemon) -> ()) {
        
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(name)").responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)")
                
                guard let pokemon = ObjectMapper.Mapper<Pokemon>().map(JSON: json) else {
                    return
                }
                completion(pokemon)
            }
        }
    }
}

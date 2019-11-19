//
//  Services.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import Alamofire

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
                
                if let sprites = json["sprites"] as? [String: Any] {
                    var urlImage: String = sprites["front_default"] as?
                        String ?? ""
                    self.sprite = urlImage
                    
                    print("hola")
                }
                if let types = json["types"] as? [[String: Any]] {
                    for typesDict in types {
                        var type = typesDict["type"] as? [String:String]
                        print("hola poke")
                        let nameType = type?["name"] as? String
                        print("consegui type")
                        self.types.append(nameType ?? "")
                    }
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tengo tipos e imagenes"), object: nil)
                    
                    print("ko")
                }
                print("ko")
                
            }
        }
    }
}

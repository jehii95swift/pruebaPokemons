//
//  DetailPokemon.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

final class DetailPokemon: UIViewController {
    
    @IBOutlet private weak var CollectionView: UICollectionView!
    @IBOutlet private weak var imageBig: UIImageView!
    @IBOutlet private weak var namePokemonLbl: UILabel!
    
    private let controller = Controller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configGradient()
    }
    
    func configurePokemon(pokemon: Pokemon) {
        let name = pokemon.name
        namePokemonLbl.text = name
        let imageUrl: String = pokemon.sprites["front_default"] as? String ?? ""
        configureImage(urlSprite: imageUrl)
    }
    
    func configureImage(urlSprite: String) {
        guard let url = URL(string: urlSprite) else { return }
        let data = try? Data(contentsOf: url)
        
        if let data = data {
            let image = UIImage(data: data)
            imageBig.image = image
            
        }
    }
    
    func requestInfo(name: String) {
        controller.requestInfo(name: name) { pokemon in
            self.configurePokemon(pokemon: pokemon)
        }
    
    }

}

private extension DetailPokemon {
    
    func configGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)    }
}


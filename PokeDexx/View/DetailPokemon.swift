//
//  DetailPokemon.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class DetailPokemon: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var services = Services()
    var controller = Controller()
    var types: [String] = []
    var sprite: String = ""
    
  
    @IBOutlet weak var imageBig: UIImageView!
    @IBOutlet weak var litleImageOne: UIImageView!
    @IBOutlet weak var litleImageTwo: UIImageView!
    @IBOutlet weak var typeOneLbl: UILabel!
    @IBOutlet weak var typeTwoLbl: UILabel!
    @IBOutlet weak var namePokemonLbl: UILabel!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(pintarTiposEImagenes), name: NSNotification.Name(rawValue: "tengo tipos e imagenes"), object: nil)
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        
    }
    func configurarPokemon(pokemon: Pokemon) {
        let name = pokemon.name
        namePokemonLbl.text = name
    }
    func configurarTipos() {
        if types.count > 0 {
            typeOneLbl.text = types[0]
        } else if types.count > 1 {
            typeTwoLbl.text = types[1]
            
        }
    }
    
    func configurarImage() {
        let url = URL(string: sprite)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageBig.image = image
            
        }
        
    }
    func requestInfo(name: String) {
        controller.requestInfo(name: name)
    }
    @objc func pintarTiposEImagenes() {
        self.sprite = controller.getNames()
        self.types = controller.getTypes()
        configurarImage()
        configurarTipos()
    }
}


//
//  ViewController.swift
//  PokeDexx
//
//  Created by Jenifer on 11/18/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var controller = Controller()
    var pokemones: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        controller.requestPokemones()
        NotificationCenter.default.addObserver(self, selector: #selector(pintarPokemones), name: NSNotification.Name(rawValue: "tengolospokemones"), object: nil)
        registrar()
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func registrar () {
        collectionView.register(UINib(nibName: "SelectPokemonCell", bundle: nil), forCellWithReuseIdentifier: "SelectPokemonCell")
    }
    @objc func pintarPokemones() {
        self.pokemones = controller.getPokemones()
        self.collectionView.reloadData()
    }
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectPokemonCell" , for: indexPath) as? SelectPokemonCell
            else { return UICollectionViewCell() }
        let namePokemon = pokemones[indexPath.row]
        
        cell.configName(pokemon: namePokemon)
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = DetailPokemon()
        let pokemon = pokemones[indexPath.row]
        vc.loadViewIfNeeded()
        vc.configurarPokemon(pokemon: pokemon)
        vc.requestInfo(name: pokemon.name)
        self.navigationController!.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt  indexpath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 80
        )
        
    }
}


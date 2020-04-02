//
//  PacotesViagensViewController.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 01/04/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
 
    @IBOutlet weak var colecaoPacote: UICollectionView!
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacote.dataSource = self
        colecaoPacote.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let viagemAtual = listaViagens[indexPath.item]
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = viagemAtual.quantidadeDeDias
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 10, height: 160)
    }

    


}

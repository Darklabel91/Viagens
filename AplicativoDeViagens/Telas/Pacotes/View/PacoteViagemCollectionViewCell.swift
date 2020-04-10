//
//  PacoteViagemCollectionViewCell.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 01/04/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacoteViagem: PacoteViagem) {
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelQuantidadeDias.text = pacoteViagem.viagem.quantidadeDeDias
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}

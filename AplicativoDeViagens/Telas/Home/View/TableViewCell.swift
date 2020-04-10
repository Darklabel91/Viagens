//
//  TableViewCell.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 29/03/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class TableViewCel: UITableViewCell {
    
    //MARK: - IBOutlets

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelImagem: UIImageView!
    
    func configuarCelula (viagem: Viagem) {
        labelTitulo.text = viagem.titulo
        labelPreco.text = "R$ \(viagem.preco)"
        labelQuantidadeDeDias.text = viagem.quantidadeDeDias == "1" ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelImagem.image = UIImage(named: viagem.caminhoDaImagem)
        labelImagem.layer.cornerRadius = 10
    }
}



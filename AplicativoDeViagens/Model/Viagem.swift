//
//  Viagem.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 29/03/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    let titulo: String
    let quantidadeDeDias: String
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo: String, quantidadeDeDias: String, preco: String, caminhoDaImagem: String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }

}

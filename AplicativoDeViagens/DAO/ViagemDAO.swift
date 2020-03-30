//
//  ViagemDAO.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 29/03/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class ViagemDAO: NSObject {
    
    func retornaTodasAsViagens() -> Array<Viagem> {
        let ceara = Viagem(titulo: "Ceará", quantidadeDeDias: "3", preco: "1000,59", caminhoDaImagem: "img1.jpg")
        let rioDeJaneiro = Viagem(titulo: "Rio de Janeiro", quantidadeDeDias: "6", preco: "1.200,09", caminhoDaImagem: "img2.jpg")
        let interiorSaoPaulo = Viagem(titulo: "Atibaia", quantidadeDeDias: "1", preco: "890,00", caminhoDaImagem: "img3.jpg")
        let paraiba = Viagem(titulo: "Paraíba", quantidadeDeDias: "3", preco: "1385,00", caminhoDaImagem: "img4.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", quantidadeDeDias: "4", preco: "3.120,00", caminhoDaImagem: "img5.jpg")
        let listaViagem: Array<Viagem> = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        return listaViagem
    }
}

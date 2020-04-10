//
//  ConfirmacaoPagamentoViewController.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 10/04/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacote: UILabel!
    @IBOutlet weak var botaoVoltarPraHome: UIButton!
    
    //MARK: - Init
    
    var pacoteComprado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelDescricaoPacote.text = pacote.descricao
            self.botaoVoltarPraHome.layer.cornerRadius = 10
        }
        let voltarButton = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(voltar))
        navigationItem.leftBarButtonItem = voltarButton
    }
    
    //MARK: - Actions
    
    @IBAction func voltar(_ sender: Any) {
        if self.navigationController != nil {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

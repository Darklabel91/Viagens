//
//  DetalhesViagensViewController.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 07/04/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollprincipal: UIScrollView!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll), name: UIResponder.keyboardWillShowNotification, object: nil)
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }

    }
    //MARK: - Métodos
    
    //Ainda não resolveu o problema do teclado :-( 
    @objc func aumentaScroll (notificacao: Notification){
        self.scrollprincipal.contentSize = CGSize(width: self.scrollprincipal.frame.width, height: self.scrollprincipal.frame.height + 320)
    }

}

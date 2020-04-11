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
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    
    //MARK: - Init
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll), name: UIResponder.keyboardWillShowNotification, object: nil)
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = "R$ \(pacote.viagem.preco)"
            self.labelQuantidadeDias.text = pacote.viagem.quantidadeDeDias == "1" ? "1 dia" : "\(pacote.viagem.quantidadeDeDias) dias"
        }
        let voltarButton = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(voltar))
        navigationItem.leftBarButtonItem = voltarButton
    }
    //MARK: - Métodos
    
    @objc func aumentaScroll(keyboardShowNotification notification: Notification) {
        if let userInfo = notification.userInfo, let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
             self.scrollprincipal.contentSize = CGSize(width: self.scrollprincipal.frame.width, height: self.scrollprincipal.frame.height + keyboardRectangle.height)
            //print(scrollprincipal.frame.height)
        }
    }
    
    @objc func exibeData(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd-MM-yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
        
    }
    
     //MARK: - Action
    
    @IBAction func textFieldEntrou(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeData(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinalizarCompra(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(identifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
        //self.present(controller, animated: true, completion: nil)
    }
    
    @objc func voltar(){
        navigationController?.popViewController(animated: true)
    }
}

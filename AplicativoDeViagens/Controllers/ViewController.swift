//
//  ViewController.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 29/03/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCel
        let viagemAtual = listaViagens[indexPath.row]
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelPreco.text = viagemAtual.preco
        cell.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelImagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}


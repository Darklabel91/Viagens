//
//  PacotesViagensViewController.swift
//  AplicativoDeViagens
//
//  Created by Daniel Fillol on 01/04/20.
//  Copyright © 2020 Entendendo Direito. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate{
 
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var colecaoPacote: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var contadorPacotes: UILabel!
    
    //MARK: - Inicializadores
    
    var listaPacotes: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaFiltrada: Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacote.dataSource = self
        colecaoPacote.delegate = self
        pesquisarViagens.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaPacotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let viagemAtual = listaPacotes[indexPath.item]
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.viagem.caminhoDaImagem)
        celulaPacote.labelTitulo.text = viagemAtual.viagem.titulo
        celulaPacote.labelQuantidadeDias.text = viagemAtual.viagem.quantidadeDeDias
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.viagem.preco)"
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 10, height: 160)
    }
    
    //MARK: - Mostrar tela detalhes
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaPacotes[indexPath.item]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(identifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true, completion: nil)
    }
    
    
    //MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        procura()
    }
    
    func procura(){
        let searchText = pesquisarViagens.text! 
        if searchText != "" {
            for viagem in listaPacotes {
                if viagem.viagem.titulo.contains(searchText) {
                    if listaFiltrada.contains(viagem) == false {
                        listaFiltrada.append(viagem)
                    }
                }
            }
            listaPacotes = listaFiltrada
        }else{
            listaPacotes = PacoteViagemDAO().retornaTodasAsViagens()
            listaFiltrada.removeAll()
        }
        self.contadorPacotes.text = atualizaLabel()
        colecaoPacote.reloadData()
    }
    
    func atualizaLabel() -> String {
        return listaPacotes.count == 1 ? "1 pacote encontrado" : "\(listaPacotes.count) pacotes encontrados"
    }
}

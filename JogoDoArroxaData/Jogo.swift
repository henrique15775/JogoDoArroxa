//
//  Jogo.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 27/06/22.
//

import Foundation


class Jogo: NSObject,ObservableObject{
     private var valorSorteado:Int
     @Published  var limiteSuperior:Int
     @Published  var limiteInferior:Int
     @Published  var status: Bool
     @Published  var tela: Telinha
     @Published  var pontuacao:Int
    
    override init(){
        //self.valorSorteado = (2...99).randomElement()!
        self.valorSorteado = 10
        self.limiteSuperior = 100
        self.limiteInferior = 1
        self.status = false
        self.tela = .mainGame
        self.pontuacao = 1000
    }
    func reiniciar(){
        self.valorSorteado = 10
        self.limiteSuperior = 100
        self.limiteInferior = 1
        self.status = false
        self.tela = .mainGame
        self.pontuacao = 1000
    }
    
    func jogar(valorAposta: Int){
        self.checkIfEqual(valorAposta: valorAposta)
        if(valorAposta < self.valorSorteado){
            self.limiteInferior = valorAposta
            self.pontuacao -= 100
        }
        else if(valorAposta > self.valorSorteado){
            self.limiteSuperior = valorAposta
            self.pontuacao -= 100
        }
        if(self.pontuacao == 0){
            self.tela = .telaDerrota
        }else{
            self.arroxou(valorAposta: valorAposta)
        }
        }
    
    
    func arroxou(valorAposta: Int){
        if(self.limiteSuperior - 1 == self.limiteInferior + 1 ){
            self.status = true
            self.tela = .telaVitoria
        }
    }
    
    func checkIfEqual(valorAposta:Int){
        if(valorAposta == self.valorSorteado && self.status == false){
            self.pontuacao = 0
            self.tela = .telaDerrota
        }
        else if(valorAposta >= self.limiteSuperior || valorAposta <= limiteInferior ){
            self.pontuacao = 0
            self.tela = .telaDerrota
        }
    }
    
    
    
}

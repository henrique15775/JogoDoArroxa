//
//  Jogo.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 27/06/22.
//

import Foundation


class Jogo: NSObject,Identifiable,ObservableObject{
     private var valorSorteado:Int
     @Published private var limiteSuperior:Int
     @Published private var limiteInferior:Int
     @Published private var status: Bool
     
    init(valorSorteado: Int, limiteSuperior:Int, limiteInferior:Int, status: Bool){
        self.valorSorteado = (2...99).randomElement()!
        self.limiteSuperior = 100
        self.limiteInferior = 1
        self.status = false
    }
    
    func arroxou(valorAposta: Int){
        if(valorAposta == self.limiteInferior + 1 && valorAposta == self.limiteSuperior - 1 ){
            self.status = true
        }
    }
    
    // arroxou -> checkIfEqual -> verificarLimites
    func verificarLimites(valorAposta: Int){
        if(self.limiteInferior < valorAposta && valorAposta < self.valorSorteado){
            self.limiteInferior = valorAposta
        }
        if(valorAposta > self.limiteInferior && valorAposta > self.valorSorteado){
            self.limiteSuperior = valorAposta
        }
    }
    
    
    
}

//
//  ContentView.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 27/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject  var game: Jogo
    @State  var isEditing = false
    @State  var valorAposta = 50.0
    @Environment(\.managedObjectContext) var viewContext
        
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Jogador.nome, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Jogador>

    var body: some View {
        if(game.tela == .mainGame){
                mainGame
        }else if(game.tela == .telaVitoria){
            TelaVitoria(game: game)
        }else{
            TelaDerrota(game: game)
        }
    }

    
    
    
}

extension ContentView{
    var mainGame: some View{
        VStack{
            HStack{
                Text("\(game.limiteInferior)")
                    .padding()
                Spacer()
                Text("\(game.limiteSuperior)").padding()
            }
            VStack{
                
                Slider(
                    value: $valorAposta,
                    in: 2...99,
                    step: 1,
                    onEditingChanged: { editing in
                                    isEditing = editing
                                }
                        )
                Text("Arraste para escolher o número")
                Text("\(Int(valorAposta))")
                Text("\(String(game.status))")
                Spacer()
                Button("Jogar"){
                    game.jogar(valorAposta: Int(valorAposta))
                }
                Spacer()
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: Jogo()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

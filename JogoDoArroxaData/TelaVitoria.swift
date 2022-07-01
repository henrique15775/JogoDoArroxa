//
//  TelaResultado.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 01/07/22.
//

import SwiftUI

struct TelaVitoria: View {
    @ObservedObject var game:Jogo
    @State var name: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Jogador.pontuacao, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Jogador>
    
    var body: some View {
        VStack{
            TextField("Nome", text: self.$name)
            Text("Ganhou")
            Text("Pontos:\(String(game.pontuacao))")
                .padding()
            Button("Salvar"){
                self.addItem()
                game.reiniciar()
                game.tela = .mainGame
            }
            List {
                            ForEach(items) { item in
                                Text("\(String(item.nome!)) ")
                                }
                        }
        }
    }
    private func addItem() {
        withAnimation {
            let newItem = Jogador(context: viewContext)
            newItem.nome = self.name
            newItem.pontuacao = Int16(self.game.pontuacao)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct TelaVitoria_Previews: PreviewProvider {
    static var previews: some View {
        TelaVitoria(game: Jogo())
    }
}

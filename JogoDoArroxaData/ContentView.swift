//
//  ContentView.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 27/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var limiteSuperior:Int = 100
    @State private var limiteInferior:Int = 1
    @State private var valorSorteado:Int = (2...99).randomElement()!
    @State private var valorAposta = 50.0
    @State private var isEditing = false
    
    @Environment(\.managedObjectContext) private var viewContext
        
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Jogador.nome, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Jogador>

    var body: some View {
        VStack{
            HStack{
                Text("\(limiteInferior)")
                    .padding()
                Spacer()
                Text("\(limiteSuperior)").padding()
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
                Spacer()
                Button("Jogar"){
                    
                }
                Spacer()
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Jogador(context: viewContext)
            newItem.nome = "saldadlsldsa"
            newItem.pontuacao = Int16(1)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//
//  JogoDoArroxaDataApp.swift
//  JogoDoArroxaData
//
//  Created by IFPB on 27/06/22.
//

import SwiftUI

@main
struct JogoDoArroxaDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

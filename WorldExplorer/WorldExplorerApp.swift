//
//  WorldExplorerApp.swift
//  WorldExplorer
//
//  Created by Ahmet Kaan UZMAN on 11.12.2021.
//

import SwiftUI

@main
struct WorldExplorerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

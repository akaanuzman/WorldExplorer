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
            TabView{
                ContentView().tabItem {
                    HStack{
                        Image(systemName: "thermometer")
                        Text("Conversion")
                    }
                }
                MapView().tabItem{
                    HStack{
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
            }
        }
    }
}

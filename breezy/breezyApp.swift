//
//  breezyApp.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

@main
struct breezyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(datas: modeData.data)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

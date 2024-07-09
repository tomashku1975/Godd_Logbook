//
//  Good_LogbookApp.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI

@main
struct Good_LogbookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

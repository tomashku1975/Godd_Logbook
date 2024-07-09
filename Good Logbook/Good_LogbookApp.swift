//
//  Good_LogbookApp.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI

import SwiftUI

@main
struct LogbookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Navigation()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

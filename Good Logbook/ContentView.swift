//
//  ContentView.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Navigation()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

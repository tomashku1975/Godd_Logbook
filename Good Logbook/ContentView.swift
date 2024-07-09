//
//  ContentView.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Pairing.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Pairing.date, ascending: true)]
    ) private var pairings: FetchedResults<Pairing>

    var body: some View {
        NavigationView {
            List {
                ForEach(pairings) { pairing in
                    DisclosureGroup {
                        ForEach(pairing.flightsArray) { flight in
                            Text("Flight: \(flight.flightNumbers ?? "Unknown Flight Number")")
                        }
                    } label: {
                        Text("Pairing: \(pairing.date ?? Date(), formatter: dateFormatter)")
                    }
                }
            }
            .navigationBarTitle("Logbook")
            .navigationBarItems(trailing: Button(action: {
                // Action to add a new pairing
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

// Helper to format the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

// Extension to get flights array from Pairing
extension Pairing {
    var flightsArray: [Flight] {
        let set = flights as? Set<Flight> ?? []
        return set.sorted {
            $0.flightNumbers ?? "" < $1.flightNumbers ?? ""
        }
    }
}

//
//  LogbookView.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI
import CoreData

struct LogbookView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Pairing.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Pairing.date, ascending: true)]
    ) private var pairings: FetchedResults<Pairing>

    var body: some View {
        NavigationView {
            List {
                ForEach(pairings) { pairing in
                    Section(header: Text("Pairing \(pairing.date ?? Date(), formatter: dateFormatter)")) {
                        ForEach(pairing.flightsArray) { flight in
                            NavigationLink(destination: FlightDetailView(flight: flight)) {
                                VStack(alignment: .leading) {
                                    Text("Flight Number: \(flight.flightNumbers ?? "")")
                                    Text("Date: \(flight.date ?? Date(), formatter: dateFormatter)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Logbook")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action to add new flight
                    }) {
                        Label("Add Flight", systemImage: "plus")
                    }
                }
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

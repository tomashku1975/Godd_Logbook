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
        sortDescriptors: [NSSortDescriptor(keyPath: \Flight.date, ascending: true)],
        animation: .default)
    private var flights: FetchedResults<Flight>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(flights) { flight in
                    NavigationLink(destination: FlightDetailView(flight: flight)) {
                        Text(flight.flightNumbers ?? "Unknown Flight Numbers")
                    }
                }
                .onDelete(perform: deleteFlights)
            }
            .navigationTitle("Logbook")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addFlight) {
                        Label("Add Flight", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    private func addFlight() {
        withAnimation {
            let newFlight = Flight(context: viewContext)
            newFlight.date = Date()
            newFlight.aircraft = "Airbus A320"
            newFlight.flightNumbers = "AB123"
            newFlight.picName = "John Doe"
            newFlight.sicName = "Jane Smith"
            newFlight.aircraftRegistration = "N12345"
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteFlights(offsets: IndexSet) {
        withAnimation {
            offsets.map { flights[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
